import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDatasource _ds;
  UserRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<User> getUser(String id) async {
    return User.fromJson(await _ds.getUser(id));
  }

  @override
  Future<User> addUser(String id, String nickname, String desc) async {
    final params = User.addUserParams(id: id, nickname: nickname, desc: desc);
    return User.fromJson(await _ds.addUser(params));
  }

  @override
  Future<User> updateUser(String id, String nickname, String desc) async {
    final params = User.updateUserParams(id: id, nickname: nickname, desc: desc);
    return User.fromJson(await _ds.updateUser(params));
  }

  @override
  Future<void> updateUserLikeCount(String userId) async {
    final user = User.fromJson(await _ds.getUser(userId));
    await _ds.updateItem(User.updateTotalLikedCountParams(count: user.totalLikedCount + 1));
  }
}
