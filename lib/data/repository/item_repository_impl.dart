import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';

class ItemRepositoryImpl implements ItemRepository {
  final RemoteDatasource _ds;
  ItemRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Item> addItem(String title, String body, bool isPublic) async {
    final params = Item.createParams(
        title,
        body,
        isPublic,
    );
    return Item.fromJson(await _ds.addItem(params));
  }

  @override
  Future<Item> editItem(String id, String title, String body, bool isPublic) async {
    final params = Item.createParams(
      title,
      body,
      isPublic,
      null,
      null,
      id
    );
    return Item.fromJson(await _ds.editItem(params));
  }

  @override
  Future<void> deleteItem(String id) async {
    await _ds.deleteItem(id);
  }

  @override
  Future<void> addLike(String itemId) async {
    final item = Item.fromJson(await _ds.getItem(itemId));
    item.likedUserIds.add(await LocalStorageManager.getMyUserId());
    await _ds.updateItem(Item.createAddLikeParams(itemId, item.likeCount + 1, item.likedUserIds));
  }

  @override
  Future<List<Item>> getItems({String userId, Item lastItem}) async {
    final jsons = await _ds.getItems(userId, lastItem?.createdAt);
    return jsons.map((json) => Item.fromJson(json)).toList();
  }
}
