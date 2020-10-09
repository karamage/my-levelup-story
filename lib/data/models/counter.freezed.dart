// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Counter _$CounterFromJson(Map<String, dynamic> json) {
  return _Counter.fromJson(json);
}

/// @nodoc
class _$CounterTearOff {
  const _$CounterTearOff();

// ignore: unused_element
  _Counter call({int counter = 0}) {
    return _Counter(
      counter: counter,
    );
  }

// ignore: unused_element
  Counter fromJson(Map<String, Object> json) {
    return Counter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Counter = _$CounterTearOff();

/// @nodoc
mixin _$Counter {
  int get counter;

  Map<String, dynamic> toJson();
  $CounterCopyWith<Counter> get copyWith;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res>;
  $Res call({int counter});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res> implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  final Counter _value;
  // ignore: unused_field
  final $Res Function(Counter) _then;

  @override
  $Res call({
    Object counter = freezed,
  }) {
    return _then(_value.copyWith(
      counter: counter == freezed ? _value.counter : counter as int,
    ));
  }
}

/// @nodoc
abstract class _$CounterCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$CounterCopyWith(_Counter value, $Res Function(_Counter) then) =
      __$CounterCopyWithImpl<$Res>;
  @override
  $Res call({int counter});
}

/// @nodoc
class __$CounterCopyWithImpl<$Res> extends _$CounterCopyWithImpl<$Res>
    implements _$CounterCopyWith<$Res> {
  __$CounterCopyWithImpl(_Counter _value, $Res Function(_Counter) _then)
      : super(_value, (v) => _then(v as _Counter));

  @override
  _Counter get _value => super._value as _Counter;

  @override
  $Res call({
    Object counter = freezed,
  }) {
    return _then(_Counter(
      counter: counter == freezed ? _value.counter : counter as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Counter with DiagnosticableTreeMixin implements _Counter {
  const _$_Counter({this.counter = 0}) : assert(counter != null);

  factory _$_Counter.fromJson(Map<String, dynamic> json) =>
      _$_$_CounterFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int counter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Counter(counter: $counter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Counter'))
      ..add(DiagnosticsProperty('counter', counter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Counter &&
            (identical(other.counter, counter) ||
                const DeepCollectionEquality().equals(other.counter, counter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(counter);

  @override
  _$CounterCopyWith<_Counter> get copyWith =>
      __$CounterCopyWithImpl<_Counter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CounterToJson(this);
  }
}

abstract class _Counter implements Counter {
  const factory _Counter({int counter}) = _$_Counter;

  factory _Counter.fromJson(Map<String, dynamic> json) = _$_Counter.fromJson;

  @override
  int get counter;
  @override
  _$CounterCopyWith<_Counter> get copyWith;
}
