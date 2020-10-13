// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$_$_NotificationFromJson(Map<String, dynamic> json) {
  return _$_Notification(
    id: json['id'] as String,
    toUserId: json['toUserId'] as String,
    fromUserId: json['fromUserId'] as String,
    fromUser: json['fromUser'] == null
        ? null
        : User.fromJson(json['fromUser'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
        NotificationType.none,
    body: json['body'] as String ?? '',
    isReaded: json['isReaded'] as bool ?? false,
    itemId: json['itemId'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$_$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'toUserId': instance.toUserId,
      'fromUserId': instance.fromUserId,
      'fromUser': instance.fromUser,
      'type': _$NotificationTypeEnumMap[instance.type],
      'body': instance.body,
      'isReaded': instance.isReaded,
      'itemId': instance.itemId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
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

const _$NotificationTypeEnumMap = {
  NotificationType.none: 'none',
  NotificationType.like: 'like',
  NotificationType.comment: 'comment',
  NotificationType.profileComment: 'profileComment',
};
