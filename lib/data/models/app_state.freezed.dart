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

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

// ignore: unused_element
  _AppState call({AppStateType stateType, int selectedTabIndex = 0}) {
    return _AppState(
      stateType: stateType,
      selectedTabIndex: selectedTabIndex,
    );
  }

// ignore: unused_element
  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  AppStateType get stateType;
  int get selectedTabIndex;

  Map<String, dynamic> toJson();
  $AppStateCopyWith<AppState> get copyWith;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({AppStateType stateType, int selectedTabIndex});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object stateType = freezed,
    Object selectedTabIndex = freezed,
  }) {
    return _then(_value.copyWith(
      stateType:
          stateType == freezed ? _value.stateType : stateType as AppStateType,
      selectedTabIndex: selectedTabIndex == freezed
          ? _value.selectedTabIndex
          : selectedTabIndex as int,
    ));
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call({AppStateType stateType, int selectedTabIndex});
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object stateType = freezed,
    Object selectedTabIndex = freezed,
  }) {
    return _then(_AppState(
      stateType:
          stateType == freezed ? _value.stateType : stateType as AppStateType,
      selectedTabIndex: selectedTabIndex == freezed
          ? _value.selectedTabIndex
          : selectedTabIndex as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AppState implements _AppState {
  const _$_AppState({this.stateType, this.selectedTabIndex = 0})
      : assert(selectedTabIndex != null);

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final AppStateType stateType;
  @JsonKey(defaultValue: 0)
  @override
  final int selectedTabIndex;

  @override
  String toString() {
    return 'AppState(stateType: $stateType, selectedTabIndex: $selectedTabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.stateType, stateType) ||
                const DeepCollectionEquality()
                    .equals(other.stateType, stateType)) &&
            (identical(other.selectedTabIndex, selectedTabIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTabIndex, selectedTabIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stateType) ^
      const DeepCollectionEquality().hash(selectedTabIndex);

  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  const factory _AppState({AppStateType stateType, int selectedTabIndex}) =
      _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  AppStateType get stateType;
  @override
  int get selectedTabIndex;
  @override
  _$AppStateCopyWith<_AppState> get copyWith;
}
