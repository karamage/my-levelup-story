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
    return Item.fromJson(await ds.addItem(params));
  }

  @override
  Future<List<Item>> getMyItems(Item lastItem) async {
  }
}
