import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_levelup_story/data/providers/app_state_provider.dart';
import 'package:my_levelup_story/ui/widgets/bottom_tabs_factory.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';

// Note: CounterApp is a HookWidget, from flutter_hooks.
class HomeScreen extends HookWidget {
  final PageController pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    final state = useProvider(appStateProvider.state);
    final app = useProvider(appStateProvider);
    return Scaffold(
      appBar: WhiteAppBar.build("My LevelUp Story"),
      body: new PageView(
        controller: pageController,
        onPageChanged: (int index) {
          app.setSelectedTab(index);
        },
        children: BottomTabsFactory.getPages(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) { // define animation
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 10), curve: Curves.ease);
        },
        currentIndex: state.selectedTabIndex,
        //selectedItemColor: Theme.of(context).primaryColor,
        //unselectedItemColor: Color(0xffcccccc),
        items: BottomTabsFactory.getTabItems(),
      ),
      floatingActionButton: _buildFab(context, state.selectedTabIndex),
    );
  }
  Widget _buildFab(BuildContext context, int index) {
    if (index != 0) {
      return null;
    }
    return FloatingActionButton(
      onPressed: () {
        /*
        AppStateModel appStateModel = Provider.of<AppStateModel>(context, listen: false);
        if (appStateModel.todayItemCount >= 5) {
          AlertDialogManager.showAlertDialog(context, "", "１日に作成できるメモの数は５個までです。時間をおいてお試しください。");
          return;
        }
        ItemsModel value = ItemsModel.initialData();
        // Add your onPressed code here!
        Navigator.pushNamed(context, Router.addItemRoute, arguments: value);
         */
      },
      child: Icon(Icons.add),
      //backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
