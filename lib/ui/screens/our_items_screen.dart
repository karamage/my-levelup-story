import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/data/providers/our_items_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/items_view_model.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';
import 'package:my_levelup_story/ui/widgets/our_item_cell.dart';
import 'package:my_levelup_story/util/app_router.dart';

class OurItemsScreen extends HookWidget {
  ItemsViewModel _vm;
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    final state = useProvider(ourItemsProvider.state);
    _vm = useProvider(ourItemsProvider);
    _context ??= context;
    final myUserState = useProvider(myUserProvider.state);
    final myUserVM = useProvider(myUserProvider);
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
              OurItemCell(
                item: item,
                myUserId: myUserState.id,
                tapLike: tapLike,
                tapComment: tapComment,
              )
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }

  Future<void> tapLike(String itemId) {
    _vm.addLike(itemId);
  }

  Future<void> tapComment(Item item) {
    Navigator.pushNamed(_context, AppRouter.commentsRoute, arguments: [item]);
  }

}
