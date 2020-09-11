import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class MyUserViewModel extends StateNotifier<User> {
  MyUserViewModel({@required UserRepository repository}) : _repository = repository, super(const User()) {}
  final UserRepository _repository;

  Future<User> addUser(String uuid, String nickname) async {
    final params = User.addUserParams(id: uuid, nickname: nickname, desc: "");
    return await _repository.addUser(params);
  }
}
