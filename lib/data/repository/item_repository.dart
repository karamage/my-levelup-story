import 'package:my_levelup_story/data/models/item.dart';

abstract class ItemRepository {
  Future<Item> addItem(String title, String body);
  Future<List<Item>> getItems({String userId, Item lastItem});
}
