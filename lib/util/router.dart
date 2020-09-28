import 'package:flutter/material.dart';
import 'package:my_levelup_story/app.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/screens/add_item_screen.dart';
import 'package:my_levelup_story/ui/screens/main_screen.dart';

class Router {
  static const String mainRoute = '/';
  static const String addItemRoute = '/add_item';

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
