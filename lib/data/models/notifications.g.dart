// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notifications _$_$_NotificationsFromJson(Map<String, dynamic> json) {
  return _$_Notifications(
    items: (json['items'] as List)
            ?.map((e) => e == null
                ? null
                : Notification.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    isLoading: json['isLoading'] as bool ?? true,
  );
}

Map<String, dynamic> _$_$_NotificationsToJson(_$_Notifications instance) =>
    <String, dynamic>{
      'items': instance.items,
      'isLoading': instance.isLoading,
    };
