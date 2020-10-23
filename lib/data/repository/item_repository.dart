import 'package:my_levelup_story/data/models/item.dart';

abstract class ItemRepository {
  Future<Item> addItem(String title, String body, bool isPublic);
  Future<Item> editItem(String id, String title, String body, bool isPublic);
  Future<void> addLike(String itemId);
  Future<List<Item>> getItems({String userId, Item lastItem});
}
