import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/auth.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthViewModel extends StateNotifier<Auth> {
  AuthViewModel({@required AuthRepository repository}) : _repository = repository, super(const Auth(isLogined: false)) {}
  final AuthRepository _repository;

  Future<User> login() async {
    return await _repository.login();
  }

  Future<void> setIsLogined(bool isLogined) async {
    state = state.copyWith(isLogined: isLogined);
  }
}