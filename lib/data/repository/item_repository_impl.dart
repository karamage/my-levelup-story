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
    var params = Item.createParams(
        title: title,
        body: body,
        isPublic: false, // TODO とりあえず
    );
    params = await ds.setFirebaseBasicParams(params);
    DocumentReference doc = await ds.db.collection(ds.ITEMS_PATH).add(params);
    DocumentSnapshot snapshot = await doc.get();
    return Item.fromJson(snapshot.data());
  }
}
