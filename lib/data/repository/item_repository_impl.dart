import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final RemoteDatasource _ds;
  ItemRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Item> addItem(String title, String body) async {
    final params = Item.createParams(
        title: title,
        body: body,
        isPublic: false, // TODO とりあえず
    );
    return Item.fromJson(await _ds.addItem(params));
  }

  @override
  Future<List<Item>> getMyItems(Item lastItem) async {
    final jsons = await _ds.getItems(lastItem?.createdAt);
    return jsons.map((json) => Item.fromJson(json)).toList();
  }
}
