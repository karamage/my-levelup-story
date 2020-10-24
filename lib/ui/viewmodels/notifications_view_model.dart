import 'package:my_levelup_story/data/models/notification.dart';
import 'package:my_levelup_story/data/models/notifications.dart';
import 'package:my_levelup_story/data/repository/notification_repository.dart';
import 'package:my_levelup_story/util/constants.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';
import 'package:state_notifier/state_notifier.dart';

class NotificationsViewModel extends StateNotifier<Notifications> {
  NotificationsViewModel(NotificationRepository repository) : _repository = repository, super(const Notifications()) {}
  final NotificationRepository _repository;

  Notification _lastItem;
  bool _isLast = false;
  String _userId;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload();
  }

  Future<void> reload() async {
    print("NotificationsViewModel reload() start");
    _clear();
    final list = await _getItems();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    // 最新のメッセージを既読にする
    if (list.length > 0 && list[0].isReaded == false) {
      _repository.updateNotificationReaded(list[0].id);
    }
    state = state.copyWith(items: list, isLoading: false);
    _prepareIsReaded();
    print("NotificationsViewModel reload() end");
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getItems();
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
    _prepareIsReaded();
  }

  Future<List<Notification>> _getItems() async {
    _userId ??= await LocalStorageManager.getMyUserId();
    return await _repository.getNotifications(userId: _userId, lastItem: _lastItem);
  }

  void _prepareIsReaded() {
    //既読にされてるもの配下はすべて既読にする
    bool isReaded = false;
    final _items = [...state.items];
    _items.forEach((item) {
      if (item.isReaded) isReaded = true;
      item = item.copyWith(isReaded: isReaded);
      _replaceItem(_items, item);
    });
    state = state.copyWith(items: _items);
  }

  _replaceItem(List<Notification> _items, Notification item) {
    final index = _items.indexWhere((_item) => _item.id == item.id);
    if (index > -1) {
      _items.removeAt(index);
      _items.insert(index, item);
    }
  }


  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
