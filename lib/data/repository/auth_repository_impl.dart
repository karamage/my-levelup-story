import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDatasource ds;
  AuthRepositoryImpl({@required this.ds});

  @override
  Future<User> login() async {
    final ret = await ds.signInAnonymously();
    if (ret == null) return null;
    return User().copyWith(id: ret[ds.ID_KEY]);
  }
}
