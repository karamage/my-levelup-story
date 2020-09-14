import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/firebase_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseDatasource ds;
  UserRepositoryImpl({@required this.ds});

  @override
  Future<User> addUser(String id, String nickname, String desc) async {
    var params = User.addUserParams(id: id, nickname: nickname, desc: desc);
    DocumentReference doc = await ds.db.collection(ds.USERS_PATH).document(id);
    DocumentSnapshot snapshot = await doc.get();
    if (!snapshot.exists) {
      ds
        ..setCreatedAtParam(params)
        ..setUpdatedAtParam(params);
      await doc.set(params, SetOptions(merge: true));
      snapshot = await doc.get();
    }
    return User.fromJson(snapshot.data());
  }
}
