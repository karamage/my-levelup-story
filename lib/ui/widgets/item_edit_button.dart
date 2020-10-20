import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/item.dart';

class ItemEditButton extends StatelessWidget {
  final Item item;
  final Future<void> Function(Item item) tapEdit;

  ItemEditButton(this.item, this.tapEdit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FlatButton.icon(
        icon: Icon(
          Icons.edit,
          color: Colors.grey,
          size: 24.0,
          semanticLabel: 'Edit',
        ),
        onPressed: () {
          if (tapEdit != null) tapEdit(item);
        },
        label: Text(""),
        color: Colors.white,
        textColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
