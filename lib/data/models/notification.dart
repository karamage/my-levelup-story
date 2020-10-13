import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_levelup_story/data/models/notification_type.dart';
import 'package:my_levelup_story/data/models/user.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    String id,
    String toUserId,

    String fromUserId,
    User fromUser,

    @Default(NotificationType.none) NotificationType type,

    @Default("") String body,
    @Default(false) bool isReaded,
    String itemId, // コメントの場合、コメントされたItemId
    DateTime createdAt,
    DateTime updatedAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
