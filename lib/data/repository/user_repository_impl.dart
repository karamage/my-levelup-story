import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/firebase_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseDatasource ds;
  UserRepositoryImpl({@required this.ds});

  @override
  Future<User> addUser(String id, String nickname, String desc) async {
    final params = User.addUserParams(id: id, nickname: nickname, desc: desc);
    return User.fromJson(await ds.addUser(params));
  }
}
