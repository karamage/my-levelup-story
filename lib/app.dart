import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/auth_provider.dart';
import 'package:my_levelup_story/ui/screens/home_screen.dart';
import 'package:my_levelup_story/ui/screens/login_screen.dart';

// Note: CounterApp is a HookWidget, from flutter_hooks.
class MyLevelUpStoryApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(authProvider.state);
    return state.isLogined ? HomeScreen():HomeScreen();
  }
}
