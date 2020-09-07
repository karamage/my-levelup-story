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
}
