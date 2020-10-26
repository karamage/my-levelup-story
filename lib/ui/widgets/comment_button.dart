import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/item.dart';


class CommentButton extends StatelessWidget {
  final Item item;
  final Future<void> Function(Item item) tapComment;

  CommentButton(this.item, this.tapComment);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FlatButton.icon(
        icon: Icon(
          Icons.chat_bubble,
          color: Colors.grey,
          size: 24.0,
          semanticLabel: 'Comment',
        ),
        label: Text("${item.commentCount > 0 ? item.commentCount:""}"),
        color: Colors.white,
        textColor: Theme.of(context).primaryColor,
        onPressed: () {
          if (tapComment != null) tapComment(item);
        },
      ),
    );
  }
}
