import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/our_items_provider.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';
import 'package:my_levelup_story/ui/widgets/our_item_cell.dart';

class OurItemsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(ourItemsProvider.state);
    final vm = useProvider(ourItemsProvider);
    useEffect((){
      vm.reload();
      return null;
    }, []);
    return EasyListView(
      items: state.items,
      onRefresh: vm.onRefresh,
      onNext: vm.next,
      buildCells: (items) => items.map((item) => OurItemCell(item: item)).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }
}
