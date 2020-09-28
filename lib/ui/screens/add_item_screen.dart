import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';

class AddItemScreen extends HookWidget {
  final Item editItem; // 更新の場合はここに値が入る。作成の場合はnull
  final Function(Item addedItem) callback;
  AddItemScreen({Key key, this.editItem, this.callback}): super(key: key);

  String headerTitle() => editItem != null ? '更新' : '成長を記録する';
  String buttonTitle() => editItem != null ? '編集する' : '作成する';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar.build(headerTitle()),
      body: Container(child: Text("AddItemScreen")),
    );
  }

}

