import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/screens/add_item_screen.dart';
import 'package:my_levelup_story/ui/screens/main_screen.dart';
import 'package:my_levelup_story/ui/screens/profile_screen.dart';

class AppRouter {
  static const String mainRoute = '/';
  static const String addItemRoute = '/add_item';
  static const String profileRoute = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
          fullscreenDialog: true,
        );
      case addItemRoute:
        final args = settings.arguments as List;
        final callback = args[0] as Function(Item addedItem);
        return MaterialPageRoute(
            builder: (_) => AddItemScreen(editItem: null, callback: callback),
            fullscreenDialog: true
        );
      case profileRoute:
        final args = settings.arguments as List;
        final userId = args[0] as String;
        return MaterialPageRoute(
            builder: (_) => ProfileScreen(userId: userId),
        );
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
