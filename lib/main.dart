import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

final counterProvider = StateNotifierProvider((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

void main() {
  runApp(
    ProviderScope(
      child: MyLevelUpStoryApp(),
    ),
  );
}

// Note: CounterApp is a HookWidget, from flutter_hooks.
class MyLevelUpStoryApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(counterProvider.state);
    final counter = useProvider(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('MyLevelUpStory')),
        body: Center(
          child: Text(state.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() => counter.increment(),
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}