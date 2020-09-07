import 'package:my_levelup_story/data/models/user.dart';

abstract class AuthRepository {
  Future<User> login();
}
