import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/widgets/input_forms_view.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';

class AddItemScreen extends HookWidget {
  final Item editItem; // 更新の場合はここに値が入る。作成の場合はnull
  final Function(Item addedItem) callback;
  AddItemScreen({Key key, this.editItem, this.callback}): super(key: key);

  String headerTitle() => editItem != null ? '更新' : '成長を記録する';
  String buttonTitle() => editItem != null ? '編集する' : '作成する';

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final bodyController = useTextEditingController();
    return Scaffold(
      appBar: WhiteAppBar.build(headerTitle()),
      body: InputFormsView(
        children: [
          _buildTitleForm(titleController),
          _buildBodyForm(bodyController),
        ],
      ),
    );
  }

  Widget _buildTitleForm(TextEditingController titleController) {
    return TextField(
      controller: titleController,
      autofocus: true,
      maxLength: 32,
      decoration: InputDecoration(
          labelText: "タイトル",
          hintText: "本を3ページ読みすすめた。"
      ),
    );
  }

  Widget _buildBodyForm(TextEditingController bodyController) {
    return TextField(
      controller: bodyController,
      //maxLines: 3,
      maxLines: null,
      maxLength: 180,
      keyboardType: TextInputType.multiline,
      //textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
          labelText: "本文",
          hintText: "「まず行動する」という言葉に勇気をもらえました。"
      ),
    );
  }
}

