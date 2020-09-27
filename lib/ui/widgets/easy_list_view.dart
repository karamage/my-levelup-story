import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EasyListView<T> extends HookWidget {
  final List<T> items;
  final VoidCallback onRefresh;
  final VoidCallback onNext;
  final List<Widget> Function(List<T> items) buildCells;
  final isLoading;
  final Widget loading;

  EasyListView({@required this.items, this.onRefresh, this.onNext, @required this.buildCells, this.isLoading, this.loading});

  @override
  Widget build(BuildContext context) {
    final sc = useScrollController();
    useEffect((){
      _setOnScroll(sc);
      return null;
    }, []);
    return Column(
      children: [
        if (items.length == 0 && isLoading == true && loading != null) loading,
        Flexible(
          child: _buildList(sc)
        ),
        if (items.length > 0 && isLoading == true && loading != null) loading,
      ],
    );
  }

  Widget _buildList(ScrollController sc) {
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

  _setOnScroll(ScrollController sc) {
    sc.addListener(() {
      final maxScrollExtent = sc.position.maxScrollExtent;
      final currentPosition = sc.position.pixels;
      if (maxScrollExtent > 0 &&
          (maxScrollExtent - 20.0) <= currentPosition) {
        onNext();
      }
    });
  }
}
