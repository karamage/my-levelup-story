import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_levelup_story/data/models/category_type.dart';
import 'package:my_levelup_story/data/models/user.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item{
  const factory Item({
    String id,
    String title,
    String body,
    int likeCount,
    int starCount,
    int commentCount,
    bool isPublic,
    CategoryType category,
    List<String> likedUserIds,
    User user,
    DateTime createdAt,
    DateTime updatedAt,
  }) = _Item;
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
