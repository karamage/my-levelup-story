import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/app_state_type.dart';
import 'package:my_levelup_story/data/providers/app_state_provider.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/screens/home_screen.dart';
import 'package:my_levelup_story/ui/screens/login_screen.dart';
import 'package:my_levelup_story/ui/screens/splash_screen.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appState = useProvider(appStateProvider.state);
    if (appState.stateType == AppStateType.initCompleted) {
      setLoginState();
    }
    switch (appState.stateType) {
      case AppStateType.init:
        return SplashScreen();
      case AppStateType.initCompleted:
        return SplashScreen(); //TODO
      case AppStateType.walkthrough:
        return SplashScreen(); //TODO
      case AppStateType.login:
        return LoginScreen();
      case AppStateType.loginCompleted:
        return HomeScreen();
    }
  }

  setLoginState() async {
    final appStateViewModel = useProvider(appStateProvider);
    final myUserViewModel = useProvider(myUserProvider);
    final userId = await myUserViewModel.getMyUserId();
    if (userId != null) {
      appStateViewModel.setAppStateType(AppStateType.loginCompleted);
    } else {
      appStateViewModel.setAppStateType(AppStateType.login);
    }
  }
}
