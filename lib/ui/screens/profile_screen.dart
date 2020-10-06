import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/profile_items_provider.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';

class ProfileScreen extends HookWidget {
  final userId;
  ProfileScreen({@required this.userId});

  @override
  Widget build(BuildContext context) {
    print("ProfileScreen userId=$userId");
    final state = useProvider(profileItemsProvider(userId).state);
    final vm = useProvider(profileItemsProvider(userId));
    useEffect((){
      vm.reload();
      return null;
    }, []);
    return Scaffold(
      appBar: WhiteAppBar.build("プロフィール"),
      body: EasyListView(
        header: Container(child: Text("Header")),
        items: state.items,
        onRefresh: vm.onRefresh,
        onNext: vm.next,
        buildCells: (items) => items.map((item) => ItemCell(item: item)).toList(),
        isLoading: state.isLoading,
        loading: LoadingIndicator(),
      ),
    );
  }
}
