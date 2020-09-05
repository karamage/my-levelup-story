import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyLevelUpStoryApp(),
    ),
  );
}

