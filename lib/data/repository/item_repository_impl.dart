import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final RemoteDatasource _ds;
  ItemRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Item> addItem(String title, String body, bool isPublic) async {
    final params = Item.createParams(
        title: title,
        body: body,
        isPublic: isPublic,
    );
    return Item.fromJson(await _ds.addItem(params));
  }

  @override
  Future<List<Item>> getItems({String userId, Item lastItem}) async {
    final jsons = await _ds.getItems(userId, lastItem?.createdAt);
    return jsons.map((json) => Item.fromJson(json)).toList();
  }
}
