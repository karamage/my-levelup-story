import 'package:my_levelup_story/data/models/counter.dart';
import 'package:state_notifier/state_notifier.dart';

class CounterViewModel extends StateNotifier<Counter> {
  CounterViewModel() : super(const Counter()) {}
  increment() => state = state.copyWith(counter: state.counter + 1);
}
