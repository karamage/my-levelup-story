import 'package:state_notifier/state_notifier.dart';

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);
  void increment() => state++;
}

