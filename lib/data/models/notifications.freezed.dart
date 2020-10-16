// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
class _$NotificationsTearOff {
  const _$NotificationsTearOff();

// ignore: unused_element
  _Notifications call(
      {List<Notification> items = const [], bool isLoading = true}) {
    return _Notifications(
      items: items,
      isLoading: isLoading,
    );
  }

// ignore: unused_element
  Notifications fromJson(Map<String, Object> json) {
    return Notifications.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Notifications = _$NotificationsTearOff();

/// @nodoc
mixin _$Notifications {
  List<Notification> get items;
  bool get isLoading;

  Map<String, dynamic> toJson();
  $NotificationsCopyWith<Notifications> get copyWith;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res>;
  $Res call({List<Notification> items, bool isLoading});
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

  final Notifications _value;
  // ignore: unused_field
  final $Res Function(Notifications) _then;

  @override
  $Res call({
    Object items = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed ? _value.items : items as List<Notification>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
abstract class _$NotificationsCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$NotificationsCopyWith(
          _Notifications value, $Res Function(_Notifications) then) =
      __$NotificationsCopyWithImpl<$Res>;
  @override
  $Res call({List<Notification> items, bool isLoading});
}

/// @nodoc
class __$NotificationsCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res>
    implements _$NotificationsCopyWith<$Res> {
  __$NotificationsCopyWithImpl(
      _Notifications _value, $Res Function(_Notifications) _then)
      : super(_value, (v) => _then(v as _Notifications));

  @override
  _Notifications get _value => super._value as _Notifications;

  @override
  $Res call({
    Object items = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_Notifications(
      items: items == freezed ? _value.items : items as List<Notification>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Notifications implements _Notifications {
  const _$_Notifications({this.items = const [], this.isLoading = true})
      : assert(items != null),
        assert(isLoading != null);

  factory _$_Notifications.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationsFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<Notification> items;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'Notifications(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Notifications &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$NotificationsCopyWith<_Notifications> get copyWith =>
      __$NotificationsCopyWithImpl<_Notifications>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationsToJson(this);
  }
}

abstract class _Notifications implements Notifications {
  const factory _Notifications({List<Notification> items, bool isLoading}) =
      _$_Notifications;

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$_Notifications.fromJson;

  @override
  List<Notification> get items;
  @override
  bool get isLoading;
  @override
  _$NotificationsCopyWith<_Notifications> get copyWith;
}
