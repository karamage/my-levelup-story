import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class UserViewModel extends StateNotifier<User> {
  UserViewModel({@required String userId, @required UserRepository repository}) : _userId = userId, _repository = repository, super(const User()) {}
  final UserRepository _repository;
  final String _userId;

  Future<void> reload() async {
    state = await _repository.getUser(_userId);
  }
}
