import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';

class ItemListView extends HookWidget {
  final List<Item> items;
  final VoidCallback onRefresh;
  final VoidCallback onNext;
  final List<Widget> Function(List<Item> items) buildCells;

  ItemListView({@required this.items, this.onRefresh, this.onNext, @required this.buildCells});

  @override
  Widget build(BuildContext context) {
    final sc = useScrollController();
    useEffect((){
      setOnScroll(sc);
      return null;
    }, []);
    return RefreshIndicator(
        onRefresh: onRefresh,
        child:ListView(
          controller: sc,
          padding: const EdgeInsets.only(top: 20.0),
          scrollDirection: Axis.vertical,
          children: buildCells(items),
        )
    );
  }

  setOnScroll(ScrollController sc) {
    sc.addListener(() {
      final maxScrollExtent = sc.position.maxScrollExtent;
      final currentPosition = sc.position.pixels;
      if (maxScrollExtent > 0 &&
          (maxScrollExtent - 20.0) <= currentPosition) {
        onNext();
      }
    });
  }

  /*
  List<Widget> getChildrenItems() {
    //return items.map((item) => ItemCell(item: item)).toList();
  }
   */
}
