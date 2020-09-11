import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  //final _db = FirebaseFirestore.instance;

  @override
  Future<User> addUser(Map<String, dynamic> params) {
    // TODO
  }
}
