import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/models/items.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class ItemsViewModel extends StateNotifier<Items> {
  ItemsViewModel({@required ItemRepository repository}) : _repository = repository, super(const Items()) {}
  final ItemRepository _repository;

  Future<void> onRefresh() async {
  }

  Future<Item> addItem(String title, String body) async {
    final item = await _repository.addItem(title, body);
    if (item != null) {
      List<Item> items = [...state.items];
      items.add(item);
      state = state.copyWith(items: items);
    }
    return item;
  }
}
