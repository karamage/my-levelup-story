import 'package:enum_to_string/enum_to_string.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/models/items.dart';
import 'package:my_levelup_story/data/models/notification_type.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/data/repository/notification_repository.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';
import 'package:my_levelup_story/util/constants.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';
import 'package:state_notifier/state_notifier.dart';

class ItemsViewModel extends StateNotifier<Items> {
  ItemsViewModel(
      ItemRepository repository,
      NotificationRepository notificationRepository,
      UserRepository userRepository,
      [String userId]
    )
      : _repository = repository,
        _notificationRepository = notificationRepository,
        _userRepository = userRepository,
        _userId = userId,
        super(const Items())
  {
    () async {
      _userId ??= await LocalStorageManager.getMyUserId();
    }();
  }

  final ItemRepository _repository;
  final NotificationRepository _notificationRepository;
  final UserRepository _userRepository;

  Item _lastItem;
  bool _isLast = false;
  String _userId;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload();
  }

  Future<void> reload() async {
    print("ItemsViewModel reload() start userId=${_userId}");
    _clear();
    final list = await _getItems();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
    print("ItemsViewModel reload() end");
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getItems();
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
  }

  Future<Item> addItem(String title, String body, bool isPublic) async {
    final item = await _repository.addItem(title, body, isPublic);
    if (item != null) state = state.copyWith(items: [...state.items]..insert(0, item));
    return item;
  }

  Future<void> addLike(String itemId) async {
    // awaitせずにlikeする
    _repository.addLike(itemId);

    var _items = [...state.items];
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index > -1) {
      Item item = _items[index];

      //お知らせを作成する
      _addLikeNotification(item);

      // userのtotalLikedCountをカウントアップ
      _userRepository.updateUserLikeCount(item.user.id);

      item = item.copyWith(likeCount: item.likeCount + 1);
      item.likedUserIds.add(await LocalStorageManager.getMyUserId());
      _items.removeAt(index);
      _items.insert(index, item);
      state = state.copyWith(items: _items);
    }
  }

  Future<void> _addLikeNotification(Item item) async {
    String name = await LocalStorageManager.getMyName();
    String uuid = await LocalStorageManager.getMyUserId();
    final body = "$nameさんが「${item.title}」に、いいね！しました。";
    final type = EnumToString.convertToString(NotificationType.like);
    final toUserId = item.user.id;
    final fromUserId = uuid;
    await _notificationRepository.addNotification(body, type, toUserId, fromUserId);
  }


  // Itemの取得場所を切り替える際はrepositoryの実装をDIで切り替えるようにする
  Future<List<Item>> _getItems() async {
    _userId ??= await LocalStorageManager.getMyUserId();
    return await _repository.getItems(userId: _userId, lastItem: _lastItem);
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
