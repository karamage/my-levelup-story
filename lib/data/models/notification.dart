import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_levelup_story/data/models/user.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    String id,
    User user,
    DateTime createdAt,
    DateTime updatedAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
