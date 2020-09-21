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

  static Map<String, dynamic> createParams(
      {
        String title,
        String body,
        bool isPublic,
        String category,
        String imageUrl,
        bool isEdit
      }
    ) {
    Map<String, dynamic> map = Map();
    map["title"] = title;
    map["body"] = body;
    if (isEdit == false || isEdit == null) {
      map["likeCount"] = 0;
      map["starCount"] = 0;
      map["commentCount"] = 0;
    }
    map["isPublic"] = isPublic;
    if (category != null) {
      map["category"] = category;
    }
    if (imageUrl != null) {
      map["imageUrl"] = imageUrl;
    }
    return map;
  }
}