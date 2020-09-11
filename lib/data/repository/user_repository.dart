import 'package:my_levelup_story/data/models/user.dart';

abstract class UserRepository {
  Future<User> addUser(Map<String, dynamic> params);
}
