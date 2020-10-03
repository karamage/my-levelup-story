import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';
import 'package:state_notifier/state_notifier.dart';

class MyUserViewModel extends StateNotifier<User> {
  MyUserViewModel({@required UserRepository repository}) : _repository = repository, super(const User()) {}
  final UserRepository _repository;

  Future<void> reload() async {
    final myUserId = await LocalStorageManager.getMyUserId();
    state = await _repository.getUser(myUserId);
  }

  Future<User> addUser(String uuid, String nickname) async {
    state = await _repository.addUser(uuid, nickname, "");
    return state.copyWith();
  }

  Future<User> updateUserSettings(String nickname, String desc) async {
    final myUserId = await LocalStorageManager.getMyUserId();
    state = await _repository.updateUser(myUserId, nickname, desc);
    return state.copyWith();
  }

  Future<void> saveMyUser(User user) async {
    await LocalStorageManager.setMyUserId(user.id);
    await LocalStorageManager.setMyName(user.nickname);
  }

  Future<String> getMyUserId() async => await LocalStorageManager.getMyUserId();
}
