import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  final ScrollController scrollController;
  final VoidCallback onRefresh;

  ItemList({@required this.items, this.scrollController, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        //onRefresh: onRefresh,
        child:ListView(
          //controller: scrollController,
          padding: const EdgeInsets.only(top: 20.0),
          scrollDirection: Axis.vertical,
          children: getChildrenItems(),
        )
    );
  }

  List<Widget> getChildrenItems() {
    return items.map((item) => ItemCell(item: item)).toList();
  }
}
