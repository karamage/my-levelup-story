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

  Item _lastItem = null;
  bool _isLast = false;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload();
  }

  Future<void> reload() async {
    print("ItemsViewModel reload start");
    _clear();
    final list = await _repository.getMyItems();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
    print("ItemsViewModel reload end");
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    print("ItemsViewModel next start");
    state = state.copyWith(isLoading: true);
    final list = await _repository.getMyItems(lastItem: _lastItem);
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
    print("ItemsViewModel next end");
  }

  Future<Item> addItem(String title, String body) async {
    final item = await _repository.addItem(title, body);
    if (item != null) state = state.copyWith(items: [...state.items]..add(item));
    return item;
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
