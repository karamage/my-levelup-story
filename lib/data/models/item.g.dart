// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$_$_ItemFromJson(Map<String, dynamic> json) {
  return _$_Item(
    id: json['id'] as String,
    title: json['title'] as String ?? '',
    body: json['body'] as String ?? '',
    likeCount: json['likeCount'] as int ?? 0,
    starCount: json['starCount'] as int ?? 0,
    commentCount: json['commentCount'] as int ?? 0,
    isPublic: json['isPublic'] as bool ?? false,
    category: _$enumDecodeNullable(_$CategoryTypeEnumMap, json['category']) ??
        CategoryType.none,
    likedUserIds:
        (json['likedUserIds'] as List)?.map((e) => e as String)?.toList() ?? [],
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'likeCount': instance.likeCount,
      'starCount': instance.starCount,
      'commentCount': instance.commentCount,
      'isPublic': instance.isPublic,
      'category': _$CategoryTypeEnumMap[instance.category],
      'likedUserIds': instance.likedUserIds,
      'user': instance.user,
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

const _$CategoryTypeEnumMap = {
  CategoryType.none: 'none',
  CategoryType.live: 'live',
  CategoryType.health: 'health',
  CategoryType.food: 'food',
  CategoryType.home: 'home',
  CategoryType.mind: 'mind',
  CategoryType.human: 'human',
  CategoryType.love: 'love',
  CategoryType.money: 'money',
  CategoryType.work: 'work',
  CategoryType.beauty: 'beauty',
  CategoryType.school: 'school',
  CategoryType.future: 'future',
  CategoryType.past: 'past',
  CategoryType.incident: 'incident',
  CategoryType.disaster: 'disaster',
};
