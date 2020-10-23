import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/item.dart';

class ItemDeleteButton extends StatelessWidget {
  final Item item;
  final Future<void> Function(Item item) tapDelete;

  ItemDeleteButton(this.item, this.tapDelete);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FlatButton.icon(
        icon: Icon(
          Icons.delete,
          color: Colors.grey,
          size: 24.0,
          semanticLabel: 'Delete',
        ),
        onPressed: () {
          if (tapDelete != null) tapDelete(item);
          /*
          AlertDialogManager.showConfirmDialog(context, "削除確認",
              "本当に削除してもよろしいですか?", "削除する", (itemId) async {
                itemsModel.deleteItem(itemId);
              }, item.id);

          */
        },
        label: Text(""),
        color: Colors.white,
        textColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
