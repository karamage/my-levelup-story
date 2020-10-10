import 'package:flutter/material.dart';
import 'package:my_levelup_story/ui/widgets/item_cell.dart';
import 'package:my_levelup_story/ui/widgets/space_box.dart';

class OurItemCell extends ItemCell {
  OurItemCell({
    @required item,
    @required myUserId,
    @required tapLike,
  }): super(
      item: item,
      myUserId: myUserId,
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
  Widget buildHeaderContents(BuildContext context) {
    return Container(child: Text("our"));
  }
}
