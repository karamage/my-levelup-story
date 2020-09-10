import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;

  @override
  Future<User> login() async {
    fb.UserCredential ret = await _auth.signInAnonymously();
    fb.User fuser = ret.user;
    if (fuser == null) return null;
    return User().copyWith(id: fuser.uid);
  }
}
