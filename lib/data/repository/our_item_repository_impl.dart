import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';

class OurItemRepositoryImpl implements ItemRepository {
  final RemoteDatasource _ds;
  OurItemRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Item> addItem(String title, String body, bool isPublic) async {
    return null; // Nothing to do.
  }

  @override
  Future<List<Item>> getItems({String userId, Item lastItem}) async {
    final jsons = await _ds.getOurItems(lastItem?.createdAt);
    return jsons.map((json) => Item.fromJson(json)).toList();
  }
}
