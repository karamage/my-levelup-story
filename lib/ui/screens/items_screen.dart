import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/items_provider.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';

class ItemsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(itemsProvider.state);
    final vm = useProvider(itemsProvider);
    final myUserState = useProvider(myUserProvider.state);
    final myUserVM = useProvider(myUserProvider);
    useEffect((){
      vm.reload();
      myUserVM.loadMyUser();
      return null;
    }, []);
    return EasyListView(
      items: state.items,
      onRefresh: vm.onRefresh,
      onNext: vm.next,
      buildCells: (items) =>
          items.map((item) =>
              ItemCell(
                item: item,
                myUserId: myUserState.id,
                tapLike: tapLike,
              )
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }

  Future<void> tapLike(String itemId) {
    print("tapLike");
  }
}
