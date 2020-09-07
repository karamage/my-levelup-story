// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    nickname: json['nickname'] as String,
    desc: json['desc'] as String,
    imageUrl: json['imageUrl'] as String,
    totalPoint: json['totalPoint'] as int,
    profileViewedCount: json['profileViewedCount'] as int,
    totalLikedCount: json['totalLikedCount'] as int,
    profileCommentCount: json['profileCommentCount'] as int,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'desc': instance.desc,
      'imageUrl': instance.imageUrl,
      'totalPoint': instance.totalPoint,
      'profileViewedCount': instance.profileViewedCount,
      'totalLikedCount': instance.totalLikedCount,
      'profileCommentCount': instance.profileCommentCount,
    };
