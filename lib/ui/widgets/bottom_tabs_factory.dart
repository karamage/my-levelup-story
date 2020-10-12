import 'package:flutter/material.dart';

import 'package:my_levelup_story/ui/screens/items_screen.dart';
import 'package:my_levelup_story/ui/screens/notifys_screen.dart';
import 'package:my_levelup_story/ui/screens/our_items_screen.dart';
import 'package:my_levelup_story/ui/screens/settings_screen.dart';

class BottomTabsFactory {
  static String headerTitle(int index) {
    switch (index) {
      case 0:
        return "Myレベルアップ";
      case 1:
        return "みんなのレベルアップ";
      case 2:
        return "お知らせ";
      case 3:
        return "設定";
      default:
        return "";
    }
  }

  static List<Widget> getPages() {
    return [
      ItemsScreen(), //call pages
      OurItemsScreen(),
      NotifysScreen(),
      SettingsScreen(), //call pages
    ];
  }

  static List<BottomNavigationBarItem> getTabItems() {
    return [
      BottomNavigationBarItem( // call each bottom item
        icon: Icon(Icons.home),
        label: 'マイリスト',
      ),
      BottomNavigationBarItem( // call each bottom item
        icon: Icon(Icons.cloud),
        label: 'みんな',
      ),
      BottomNavigationBarItem( // call each bottom item
        icon: Icon(Icons.home),
        label: 'お知らせ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: '設定',
      )
    ];
  }
}
