import 'package:my_levelup_story/data/models/auth.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthViewModel extends StateNotifier<Auth> {
  AuthViewModel() : super(const Auth()) {}
}