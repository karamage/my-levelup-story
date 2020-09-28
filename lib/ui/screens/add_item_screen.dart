import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/providers/items_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/items_view_model.dart';
import 'package:my_levelup_story/ui/widgets/input_forms_view.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';
import 'package:my_levelup_story/util/loading_dialog.dart';

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
    final vm = useProvider(itemsProvider);
    return Scaffold(
      appBar: WhiteAppBar.build(headerTitle()),
      body: InputFormsView(
        children: [
          _buildTitleForm(titleController),
          _buildBodyForm(bodyController),
          _buildSubmitButton(vm, titleController, bodyController, context),
        ],
      ),
    );
  }

  _submit(ItemsViewModel vm, TextEditingController titlec, TextEditingController bodyc, BuildContext ctx) async {
    final String title = titlec.text;
    final String body = bodyc.text;
    LoadingDialog.showLoading(ctx);
    final addedItem = await vm.addItem(title, body);
    LoadingDialog.hideLoading(ctx);
    if (callback != null) callback(addedItem);
    Navigator.pop(ctx);
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

  Widget _buildSubmitButton(ItemsViewModel vm, TextEditingController titlec, TextEditingController bodyc, BuildContext ctx) {
    return RaisedButton(
      child: Text(buttonTitle()),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () => _submit(vm, titlec, bodyc, ctx),
    );
  }
}

