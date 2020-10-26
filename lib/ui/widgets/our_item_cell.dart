import 'package:flutter/material.dart';
import 'package:my_levelup_story/ui/widgets/comment_button.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';
import 'package:my_levelup_story/ui/widgets/like_button.dart';
import 'package:my_levelup_story/ui/widgets/space_box.dart';

class OurItemCell extends ItemCell {
  OurItemCell({
    @required item,
    @required myUserId,
    @required tapComment,
    @required tapLike,
  }): super(
      item: item,
      myUserId: myUserId,
      tapComment: tapComment,
      tapLike: tapLike
  );

  @override
  Widget buildContents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildHeaderContents(context),
        SpaceBox.height(8),
        buildMainContents(context),
        buildImageContents(context),
        buildCommentContents(context),
        buildButtonContents(context),
      ],
    );
  }

  @override
  Widget buildButtonContents(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CommentButton(
                item,
                tapComment
            ),
          ),
          Expanded(
            child: LikeButton(
                isLiked: isMyLiked(),
                likeCount: item.likeCount,
                itemId: item.id,
                tapLike: tapLike
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildHeaderContents(BuildContext context) {
    return Container();
  }
}
