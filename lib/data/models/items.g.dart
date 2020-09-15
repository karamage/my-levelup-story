// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Items _$_$_ItemsFromJson(Map<String, dynamic> json) {
  return _$_Items(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ItemsToJson(_$_Items instance) => <String, dynamic>{
      'items': instance.items,
    };
