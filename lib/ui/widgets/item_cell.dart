import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/category_type.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/widgets/space_box.dart';
import 'package:my_levelup_story/ui/widgets/user_avator.dart';
import 'package:my_levelup_story/util/app_router.dart';

class ItemCell extends StatelessWidget {
  final Item item;
  ItemCell({@required this.item});

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context ??= context;
    return Padding(
      key: ValueKey(item.id),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
          ),
          //borderRadius: BorderRadius.circular(5.0),
        ),
        child: buildContents(context),
      ),
    );
  }

  Widget buildContents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //buildHeaderContents(context),
        //SpaceBox.height(8),
        buildMainContents(context),
        buildImageContents(context),
        buildCommentContents(context),
        buildButtonContents(context),
      ],
    );
  }

  Widget buildHeaderContents(BuildContext context) {
    return Container();
  }

  Widget buildImageContents(BuildContext context) {
    return Container();
  }

  Widget buildCommentContents(BuildContext context) {
    return Container();
  }

  Widget buildButtonContents(BuildContext context) {
    return Container();
  }

  onTapUserAvator(String id) {
    Navigator.pushNamed(_context, AppRouter.profileRoute, arguments: [id]);
  }

  Widget buildMainContents(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SpaceBox.width(16),
        UserAvator(user: item.user, onTap: onTapUserAvator),
        SpaceBox.width(16),
        Expanded(
          child: GestureDetector(
            // タップしたらコメント画面に遷移するように
            onTap: () {
              //showCommentList(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(item.user.nickname, style: Theme.of(context).textTheme.subhead),
                    ),
                    //Text(item.createdAtMMDD(), style: Theme.of(context).textTheme.caption),
                    SpaceBox.width(4),
                  ],
                ),
                SpaceBox.height(8),
                if (item.isPublic == true) Text("公開"),
                Text(item.title, style: Theme.of(context).textTheme.title),
                SpaceBox.height(4),
                Text(item.body, style: Theme.of(context).textTheme.body1),
                /*
                SpaceBox.height(8),
                item.category == CategoryType.none ?
                Container() :
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
                      child: Text('${HandleEnum.categoryTypeLabel(item.category)}',  style: TextStyle(color: Theme.of(context).primaryColor))
                  ),
                )
                */
              ],
            ),
          ),
        ),
        SpaceBox.width(16),
      ],
    );
  }
}
