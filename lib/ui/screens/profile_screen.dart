import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/data/providers/profile_items_provider.dart';
import 'package:my_levelup_story/data/providers/user_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/items_view_model.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';
import 'package:my_levelup_story/ui/widgets/our_item_cell.dart';
import 'package:my_levelup_story/ui/widgets/space_box.dart';
import 'package:my_levelup_story/ui/widgets/user_avator.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';
import 'package:my_levelup_story/util/app_router.dart';

class ProfileScreen extends HookWidget {
  final userId;
  ProfileScreen({@required this.userId});

  ItemsViewModel _vm;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    final state = useProvider(profileItemsProvider(userId).state);
    _vm = useProvider(profileItemsProvider(userId));
    _context ??= context;
    final userState = useProvider(userProvider(userId).state);
    final userVM = useProvider(userProvider(userId));
    final myUserState = useProvider(myUserProvider.state);
    final myUserVM = useProvider(myUserProvider);
    useEffect((){
      _vm.reload();
      userVM.reload();
      myUserVM.loadMyUser();
      return null;
    }, []);
    return Scaffold(
      appBar: WhiteAppBar.build("プロフィール"),
      body: EasyListView(
        header: _buildHeader(context, userState),
        items: state.items,
        onRefresh: _vm.onRefresh,
        onNext: _vm.next,
        buildCells: (items) =>
            items.map((item) =>
                OurItemCell(
                  item: item,
                  myUserId: myUserState.id,
                  tapLike: tapLike,
                  tapComment: tapComment,
                )
            ).toList(),
        isLoading: state.isLoading,
        loading: LoadingIndicator(),
      ),
    );
  }

  Future<void> tapLike(String itemId) {
    _vm.addLike(itemId);
  }

  Future<void> tapComment(Item item) {
    Navigator.pushNamed(_context, AppRouter.commentsRoute, arguments: [item]);
  }

  Widget _buildHeader(BuildContext ctx, User user) {
    return Column(                                        //modified
        children: <Widget>[                                         //new
          Material(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: UserAvator(user: user),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text(user.nickname ?? "", style: Theme.of(ctx).textTheme.subhead),
                          ),
                          SpaceBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text("${user.desc ?? ""}"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SpaceBox(height: 8.0),
                /*
                Text("癒やしポイント ${totalPoint}pt"),
                SpaceBox(height: 8.0),
                Text("いいね！されてる数 ${totalLikedCount}いいね！"),
                SpaceBox(height: 8.0),
                //SpaceBox(height: 16.0),
                Divider(height: 1.0),                                 //new
                */
                Container(
                  child: Text("公開している成長", style: Theme.of(ctx).textTheme.caption),
                ),
                Divider(height: 1.0),                                 //new
              ],
            ),
          ),
        ]);
  }
}
