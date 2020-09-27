import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/items_provider.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';

class ItemsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(itemsProvider.state);
    final vm = useProvider(itemsProvider);
    useEffect((){
      vm.reload();
      return null;
    }, []);
    return Column(
      children: [
        if (state.items.length == 0 && state.isLoading) LoadingIndicator(),
        Flexible(
          child:EasyListView(
              items: state.items,
              onRefresh: vm.onRefresh,
              onNext: vm.next,
              buildCells: (items) => items.map((item) => ItemCell(item: item)).toList(),
          ),
        ),
        if (state.items.length > 0 && state.isLoading) LoadingIndicator(),
      ],
    );
  }
}
