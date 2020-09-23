import 'package:flutter/material.dart';

import 'package:my_levelup_story/ui/screens/items_screen.dart';
import 'package:my_levelup_story/ui/screens/settings_screen.dart';

class BottomTabsFactory {
  static String headerTitle(int index) {
    switch (index) {
      case 0:
        return "Myリスト";
      case 1:
        return "設定";
      default:
        return "";
    }
  }

  static List<Widget> getPages() {
    return [
      ItemsScreen(), //call pages
      SettingsScreen(), //call pages
    ];
  }

  static List<BottomNavigationBarItem> getTabItems() {
    return [
      BottomNavigationBarItem( // call each bottom item
        icon: new Icon(Icons.home),
        //icon: FaIcon(FontAwesomeIcons.leaf),
        title: new Text('マイリスト'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: Text('設定'),
      )
    ];
  }
}
