import 'package:my_levelup_story/data/models/user.dart';

abstract class UserRepository {
  Future<User> getUser(String id);
  Future<User> addUser(String id, String nickname, String desc);
}
