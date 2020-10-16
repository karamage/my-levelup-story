import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_levelup_story/data/models/notification.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

@freezed
abstract class Notifications with _$Notifications{
  const factory Notifications({
    @Default([]) List<Notification> items,
    @Default(true) bool isLoading,
  }) = _Notifications;
  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);
}
