import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
abstract class Counter with _$Counter{
  const factory Counter({
    @Default(0) int counter,
  }) = _Counter;
  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
