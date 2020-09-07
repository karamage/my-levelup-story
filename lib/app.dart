import 'package:flutter/material.dart';
import 'package:my_levelup_story/util/router.dart';

// Note: CounterApp is a HookWidget, from flutter_hooks.
class MyLevelUpStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'MyLevelUp Story',
      /*
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 202, 192, 1.0),
        disabledColor: Color.fromRGBO(220, 220, 220, 1.0),
      ),
       */
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.mainRoute,
    );
  }
}
