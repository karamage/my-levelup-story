import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class ItemsViewModel extends StateNotifier<Item> {
  ItemsViewModel({@required ItemRepository repository}) : _repository = repository, super(const Item()) {}
  final ItemRepository _repository;

  Future<Item> addItem(String title, String body) async {
    state = await _repository.addItem(title, body);
    return state.copyWith();
  }
}
