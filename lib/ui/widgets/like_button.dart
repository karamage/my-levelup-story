import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final int likeCount;
  final String itemId;
  final Future<void> Function(String itemId) tapLike;

  LikeButton({
    @required this.isLiked,
    @required this.likeCount,
    @required this.itemId,
    @required this.tapLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FlatButton.icon(
        icon: Icon(
          Icons.favorite,
          color: isLiked ? Theme.of(context).primaryColor:Colors.grey,
          size: 24.0,
          semanticLabel: 'Like',
        ),
        label: Text("${likeCount > 0 ? likeCount:""}"),
        onPressed: isLiked ? null : () {
          tapLike(itemId);
        },
        color: Colors.white,
        textColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
