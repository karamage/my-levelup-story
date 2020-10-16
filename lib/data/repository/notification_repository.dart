import 'package:my_levelup_story/data/models/notification.dart';

abstract class NotificationRepository {
  Future<Notification> addNotification(String body, String type, String toUserId, String fromUserId, [String itemId]);
  Future<List<Notification>> getNotifications({String userId, Notification lastItem});
}
