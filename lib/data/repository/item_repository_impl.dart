import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/firebase_datasource.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final FirebaseDatasource ds;
  ItemRepositoryImpl({@required this.ds});

  @override
  Future<Item> addItem(String title, String body) async {
    /* TODO
    パラメータに含めるもの、id, userRef isPublic 忘れないように
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
    */
  }
}
