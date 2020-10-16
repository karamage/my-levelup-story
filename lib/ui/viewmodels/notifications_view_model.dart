import 'package:enum_to_string/enum_to_string.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/models/notification.dart';
import 'package:my_levelup_story/data/models/notification_type.dart';
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

  /*
  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload();
  }
  */

  Future<void> reload() async {
    print("NotificationsViewModel reload() start");
    _clear();
    final list = await _getItems();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
    print("NotificationsViewModel reload() end");
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getItems();
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
  }

  Future<void> addLikeNotification(Item item) async {
    String name = await LocalStorageManager.getMyName();
    String uuid = await LocalStorageManager.getMyUserId();
    final body = "$nameさんが「${item.title}」に、いいね！しました。";
    final type = EnumToString.convertToString(NotificationType.like);
    final toUserId = item.user.id;
    final fromUserId = uuid;
    await _repository.addNotification(body, type, toUserId, fromUserId);
  }

  Future<List<Notification>> _getItems() async {
    _userId ??= await LocalStorageManager.getMyUserId();
    return await _repository.getNotifications(userId: _userId, lastItem: _lastItem);
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
