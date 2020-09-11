import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String id,
    String nickname,
    String desc,
    String imageUrl,
    int totalPoint,
    int profileViewedCount,
    int totalLikedCount,
    int profileCommentCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  // User作成の際のパラメータ
  static Map<String, dynamic> addUserParams({String id, String nickname, String desc}) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["nickname"] = nickname;
    map["desc"] = desc;
    map["totalLikedCount"] = 0;
    map["totalStaredCount"] = 0;
    return map;
  }
}
