// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

// ignore: unused_element
  _Notification call(
      {String id,
      String toUserId,
      String fromUserId,
      User fromUser,
      NotificationType type = NotificationType.none,
      String body = '',
      bool isReaded = false,
      String itemId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return _Notification(
      id: id,
      toUserId: toUserId,
      fromUserId: fromUserId,
      fromUser: fromUser,
      type: type,
      body: body,
      isReaded: isReaded,
      itemId: itemId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

// ignore: unused_element
  Notification fromJson(Map<String, Object> json) {
    return Notification.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  String get id;
  String get toUserId;
  String get fromUserId;
  User get fromUser;
  NotificationType get type;
  String get body;
  bool get isReaded;
  String get itemId; // コメントの場合、コメントされたItemId
  DateTime get createdAt;
  DateTime get updatedAt;

  Map<String, dynamic> toJson();
  $NotificationCopyWith<Notification> get copyWith;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String toUserId,
      String fromUserId,
      User fromUser,
      NotificationType type,
      String body,
      bool isReaded,
      String itemId,
      DateTime createdAt,
      DateTime updatedAt});

  $UserCopyWith<$Res> get fromUser;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object id = freezed,
    Object toUserId = freezed,
    Object fromUserId = freezed,
    Object fromUser = freezed,
    Object type = freezed,
    Object body = freezed,
    Object isReaded = freezed,
    Object itemId = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      toUserId: toUserId == freezed ? _value.toUserId : toUserId as String,
      fromUserId:
          fromUserId == freezed ? _value.fromUserId : fromUserId as String,
      fromUser: fromUser == freezed ? _value.fromUser : fromUser as User,
      type: type == freezed ? _value.type : type as NotificationType,
      body: body == freezed ? _value.body : body as String,
      isReaded: isReaded == freezed ? _value.isReaded : isReaded as bool,
      itemId: itemId == freezed ? _value.itemId : itemId as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }

  @override
  $UserCopyWith<$Res> get fromUser {
    if (_value.fromUser == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.fromUser, (value) {
      return _then(_value.copyWith(fromUser: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) then) =
      __$NotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String toUserId,
      String fromUserId,
      User fromUser,
      NotificationType type,
      String body,
      bool isReaded,
      String itemId,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $UserCopyWith<$Res> get fromUser;
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(
      _Notification _value, $Res Function(_Notification) _then)
      : super(_value, (v) => _then(v as _Notification));

  @override
  _Notification get _value => super._value as _Notification;

  @override
  $Res call({
    Object id = freezed,
    Object toUserId = freezed,
    Object fromUserId = freezed,
    Object fromUser = freezed,
    Object type = freezed,
    Object body = freezed,
    Object isReaded = freezed,
    Object itemId = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_Notification(
      id: id == freezed ? _value.id : id as String,
      toUserId: toUserId == freezed ? _value.toUserId : toUserId as String,
      fromUserId:
          fromUserId == freezed ? _value.fromUserId : fromUserId as String,
      fromUser: fromUser == freezed ? _value.fromUser : fromUser as User,
      type: type == freezed ? _value.type : type as NotificationType,
      body: body == freezed ? _value.body : body as String,
      isReaded: isReaded == freezed ? _value.isReaded : isReaded as bool,
      itemId: itemId == freezed ? _value.itemId : itemId as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Notification implements _Notification {
  const _$_Notification(
      {this.id,
      this.toUserId,
      this.fromUserId,
      this.fromUser,
      this.type = NotificationType.none,
      this.body = '',
      this.isReaded = false,
      this.itemId,
      this.createdAt,
      this.updatedAt})
      : assert(type != null),
        assert(body != null),
        assert(isReaded != null);

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationFromJson(json);

  @override
  final String id;
  @override
  final String toUserId;
  @override
  final String fromUserId;
  @override
  final User fromUser;
  @JsonKey(defaultValue: NotificationType.none)
  @override
  final NotificationType type;
  @JsonKey(defaultValue: '')
  @override
  final String body;
  @JsonKey(defaultValue: false)
  @override
  final bool isReaded;
  @override
  final String itemId;
  @override // コメントの場合、コメントされたItemId
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Notification(id: $id, toUserId: $toUserId, fromUserId: $fromUserId, fromUser: $fromUser, type: $type, body: $body, isReaded: $isReaded, itemId: $itemId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Notification &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.toUserId, toUserId) ||
                const DeepCollectionEquality()
                    .equals(other.toUserId, toUserId)) &&
            (identical(other.fromUserId, fromUserId) ||
                const DeepCollectionEquality()
                    .equals(other.fromUserId, fromUserId)) &&
            (identical(other.fromUser, fromUser) ||
                const DeepCollectionEquality()
                    .equals(other.fromUser, fromUser)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.isReaded, isReaded) ||
                const DeepCollectionEquality()
                    .equals(other.isReaded, isReaded)) &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(toUserId) ^
      const DeepCollectionEquality().hash(fromUserId) ^
      const DeepCollectionEquality().hash(fromUser) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(isReaded) ^
      const DeepCollectionEquality().hash(itemId) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @override
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationToJson(this);
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {String id,
      String toUserId,
      String fromUserId,
      User fromUser,
      NotificationType type,
      String body,
      bool isReaded,
      String itemId,
      DateTime createdAt,
      DateTime updatedAt}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  String get id;
  @override
  String get toUserId;
  @override
  String get fromUserId;
  @override
  User get fromUser;
  @override
  NotificationType get type;
  @override
  String get body;
  @override
  bool get isReaded;
  @override
  String get itemId;
  @override // コメントの場合、コメントされたItemId
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  _$NotificationCopyWith<_Notification> get copyWith;
}
