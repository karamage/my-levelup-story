import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/providers/items_provider.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/items_view_model.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';
import 'package:my_levelup_story/util/app_router.dart';

class ItemsScreen extends HookWidget {
  ItemsViewModel _vm;
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    final state = useProvider(itemsProvider.state);
    _vm = useProvider(itemsProvider);
    final myUserState = useProvider(myUserProvider.state);
    final myUserVM = useProvider(myUserProvider);
    _context ??= context;
    useEffect((){
      _vm.reload();
      myUserVM.loadMyUser();
      return null;
    }, []);
    return EasyListView(
      items: state.items,
      onRefresh: _vm.onRefresh,
      onNext: _vm.next,
      buildCells: (items) =>
          items.map((item) =>
              ItemCell(
                item: item,
                myUserId: myUserState.id,
                tapLike: tapLike,
                tapEdit: tapEdit,
              )
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }

  Future<void> tapLike(String itemId) {
    _vm.addLike(itemId);
  }

  Future<void> tapEdit(Item item) {
    Navigator.pushNamed(_context, AppRouter.editItemRoute, arguments: [item, completedEditItem]);
  }

  Future<void> completedEditItem(Item item) {
    print("completedEditItem");
  }
}
