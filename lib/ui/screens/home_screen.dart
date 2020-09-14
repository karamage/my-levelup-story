import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_levelup_story/data/providers/counter_provider.dart';
import 'package:tapable_circle_image_avator/tapable_circle_image_avator.dart';

// Note: CounterApp is a HookWidget, from flutter_hooks.
class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(counterProvider.state);
    final counter = useProvider(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('MyLevelUpStory app')),
      body: Column(
        children: [
          Center(
            child: Text(state.toString()),
          ),
          TapableCircleImageAvator(id:"fsdfa", name: "karamage",)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => counter.increment(),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
