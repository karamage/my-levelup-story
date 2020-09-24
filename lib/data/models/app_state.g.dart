// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    stateType: _$enumDecodeNullable(_$AppStateTypeEnumMap, json['stateType']),
    selectedTabIndex: json['selectedTabIndex'] as int ?? 0,
  );
}

Map<String, dynamic> _$_$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'stateType': _$AppStateTypeEnumMap[instance.stateType],
      'selectedTabIndex': instance.selectedTabIndex,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AppStateTypeEnumMap = {
  AppStateType.init: 'init',
  AppStateType.initCompleted: 'initCompleted',
  AppStateType.walkthrough: 'walkthrough',
  AppStateType.login: 'login',
  AppStateType.loginCompleted: 'loginCompleted',
};
