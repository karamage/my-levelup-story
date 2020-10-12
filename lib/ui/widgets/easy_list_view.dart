import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EasyListView<T> extends HookWidget {
  final List<T> items;
  final VoidCallback onRefresh;
  final VoidCallback onNext;
  final List<Widget> Function(List<T> items) buildCells;
  final isLoading;
  final Widget loading;
  final Widget header;

  EasyListView({@required this.items, this.onRefresh, this.onNext, @required this.buildCells, this.isLoading, this.loading, this.header});

  @override
  Widget build(BuildContext context) {
    final sc = useScrollController();
    useEffect((){
      _setOnScroll(sc);
      return null;
    }, []);
    return Column(
      children: [
        //if (_isShowLoading()) loading,
        Flexible(
          child: _buildRefreshList(sc)
        ),
        if (_isShowLoading()) loading,
      ],
    );
  }

  _isShowLoading() => /*items.length == 0 &&*/ isLoading == true && loading != null;

  Widget _buildRefreshList(ScrollController sc) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: header != null ? _buildHeaderListView(sc) : _buildListView(sc),
    );
  }

  Widget _buildListView(ScrollController sc) {
    return ListView(
      controller: sc,
      padding: const EdgeInsets.only(top: 20.0),
      scrollDirection: Axis.vertical,
      children: buildCells(items),
    );
  }

  Widget _buildHeaderListView(ScrollController sc) {
    final cells = buildCells(items);
    return ListView.builder(
      controller: sc,
      scrollDirection: Axis.vertical,
      itemCount: items.length + 1,                          //new
      itemBuilder: (_, int index) {
        return index == 0 ? header : cells[index - 1];
      },
    );
  }

  _setOnScroll(ScrollController sc) {
    sc.addListener(() {
      final maxScrollExtent = sc.position.maxScrollExtent;
      final currentPosition = sc.position.pixels;
      if (maxScrollExtent > 0 &&
          (maxScrollExtent - 20.0) <= currentPosition) {
        if (onNext != null) {
          onNext();
        }
      }
    });
  }
}
