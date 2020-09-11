// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

class _$AppStateTearOff {
  const _$AppStateTearOff();

// ignore: unused_element
  _AppState call({bool isLogined}) {
    return _AppState(
      isLogined: isLogined,
    );
  }
}

// ignore: unused_element
const $AppState = _$AppStateTearOff();

mixin _$AppState {
  bool get isLogined;

  Map<String, dynamic> toJson();
  $AppStateCopyWith<AppState> get copyWith;
}

abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({bool isLogined});
}

class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object isLogined = freezed,
  }) {
    return _then(_value.copyWith(
      isLogined: isLogined == freezed ? _value.isLogined : isLogined as bool,
    ));
  }
}

abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLogined});
}

class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object isLogined = freezed,
  }) {
    return _then(_AppState(
      isLogined: isLogined == freezed ? _value.isLogined : isLogined as bool,
    ));
  }
}

@JsonSerializable()
class _$_AppState implements _AppState {
  const _$_AppState({this.isLogined});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final bool isLogined;

  @override
  String toString() {
    return 'AppState(isLogined: $isLogined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.isLogined, isLogined) ||
                const DeepCollectionEquality()
                    .equals(other.isLogined, isLogined)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isLogined);

  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  const factory _AppState({bool isLogined}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  bool get isLogined;
  @override
  _$AppStateCopyWith<_AppState> get copyWith;
}
