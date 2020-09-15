import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_levelup_story/data/models/item.dart';

part 'items.freezed.dart';
part 'items.g.dart';

@freezed
abstract class Items with _$Items{
  const factory Items({
    List<Item> items
  }) = _Items;
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}
