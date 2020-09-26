import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDatasource _ds;
  AuthRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<User> login() async {
    final ret = await _ds.signInAnonymously();
    if (ret == null) return null;
    print("login ok ID_KEY=${_ds.ID_KEY} id=${ret[_ds.ID_KEY]}");
    return User().copyWith(id: ret[_ds.ID_KEY]);
  }
}
