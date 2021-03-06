import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';

class OurItemRepositoryImpl implements ItemRepository {
  final RemoteDatasource _ds;
  OurItemRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Item> addItem(String title, String body, bool isPublic) async {
    return null; // Nothing to do.
  }

  @override
  Future<void> addLike(String itemId) async {
    final item = Item.fromJson(await _ds.getItem(itemId));
    item.likedUserIds.add(await LocalStorageManager.getMyUserId());
    await _ds.updateItem(Item.createAddLikeParams(itemId, item.likeCount + 1, item.likedUserIds));
  }

  @override
  Future<List<Item>> getItems({String userId, Item lastItem}) async {
    final jsons = await _ds.getOurItems(lastItem?.createdAt);
    return jsons.map((json) => Item.fromJson(json)).toList();
  }

  @override
  Future<Item> editItem(String id, String title, String body, bool isPublic) {
    // TODO: implement editItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}
