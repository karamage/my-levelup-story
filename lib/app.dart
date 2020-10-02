import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/app_state_provider.dart';
import 'package:my_levelup_story/util/app_router.dart';

// Note: CounterApp is a HookWidget, from flutter_hooks.
class MyLevelUpStoryApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appState = useProvider(appStateProvider);
    useEffect((){
      () async {
        print("appState.initApp() start");
        await appState.initApp();
        print("appState.initApp() end");
      }();
      return null;
    }, []);
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'MyLevelUp Story',
      /*
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 202, 192, 1.0),
        disabledColor: Color.fromRGBO(220, 220, 220, 1.0),
      ),
       */
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.mainRoute,
    );
  }
}
