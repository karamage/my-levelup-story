import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/models/items.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/util/constants.dart';
import 'package:state_notifier/state_notifier.dart';

class ItemsViewModel extends StateNotifier<Items> {
  ItemsViewModel({@required ItemRepository repository}) : _repository = repository, super(const Items()) {
    print("ItemsViewModel init");
  }
  final ItemRepository _repository;

  bool _isLoading = false;
  Item _lastItem = null;
  bool _isLast = false;

  Future<void> onRefresh() async {
  }

  Future<void> reload() async {
    if (_isLoading) return;
    print("ItemsViewModel reload start");
    _clear();
    _isLoading = true;
    final list = await _repository.getMyItems(null);
    if (list.length > 0) {
      _lastItem = list.last;
    }
    _isLast = list.length < LIST_LIMIT;
    _isLoading = false;
    state = state.copyWith(items: list);
    print("ItemsViewModel reload end");
  }

  Future<void> next() async {
    print("ItemsViewModel next start");
    print("ItemsViewModel next end");
  }

  Future<Item> addItem(String title, String body) async {
    final item = await _repository.addItem(title, body);
    if (item != null) {
      state = state.copyWith(items: [...state.items]..add(item));
    }
    return item;
  }

  _clear() {
    _isLoading = false;
    _isLast = false;
    _lastItem = null;
  }
}
