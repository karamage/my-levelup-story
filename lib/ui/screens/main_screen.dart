import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/app_state_provider.dart';
import 'package:my_levelup_story/data/providers/auth_provider.dart';
import 'package:my_levelup_story/ui/screens/home_screen.dart';
import 'package:my_levelup_story/ui/screens/login_screen.dart';
import 'package:my_levelup_story/ui/screens/splash_screen.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appState = useProvider(appStateProvider.state);
    final authState = useProvider(authProvider.state);
    if (!appState.isInitCompleted) {
      return SplashScreen();
    }
    return authState.isLogined ? HomeScreen(): LoginScreen();
  }
}
