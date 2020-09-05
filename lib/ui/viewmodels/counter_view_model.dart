import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'counter_view_model.freezed.dart';
part 'counter_view_model.g.dart';

@freezed
abstract class Counter with _$Counter{
  const factory Counter({
    @Default(0) int counter,
  }) = _Counter;
  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}

class CounterViewModel extends StateNotifier<Counter> {
  CounterViewModel() : super(const Counter()) {}
  increment() => state = state.copyWith(counter: state.counter + 1);
}
