import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/models/items.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class ItemsViewModel extends StateNotifier<Items> {
  ItemsViewModel({@required ItemRepository repository}) : _repository = repository, super(const Items()) {
    print("ItemsViewModel init");
  }
  final ItemRepository _repository;

  Future<void> onRefresh() async {
  }

  Future<void> reload() async {
    print("ItemsViewModel reload");
  }
  Future<void> next() async {
    print("ItemsViewModel next");
  }

  Future<Item> addItem(String title, String body) async {
    final item = await _repository.addItem(title, body);
    if (item != null) {
      state = state.copyWith(items: [...state.items]..add(item));
    }
    return item;
  }
}
