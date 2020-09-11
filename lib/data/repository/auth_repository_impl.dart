import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepositoryImpl implements AuthRepository {
  fb.FirebaseAuth _auth;

  AuthRepositoryImpl() {
    () async {
      await Firebase.initializeApp();
      _auth = fb.FirebaseAuth.instance;
    }();
  }

  @override
  Future<User> login() async {
    fb.UserCredential ret = await _auth.signInAnonymously();
    fb.User fuser = ret.user;
    if (fuser == null) return null;
    return User().copyWith(id: fuser.uid);
  }
}
