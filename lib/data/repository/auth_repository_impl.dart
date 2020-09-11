import 'package:flutter/cupertino.dart';
import 'package:my_levelup_story/data/datasource/firebase_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseDatasource ds;
  AuthRepositoryImpl({@required this.ds});

  @override
  Future<User> login() async {
    final ret = await ds.auth.signInAnonymously();
    final fuser = ret.user;
    if (fuser == null) return null;
    return User().copyWith(id: fuser.uid);
  }
}
