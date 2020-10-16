import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/notification.dart';
import 'package:my_levelup_story/data/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final RemoteDatasource _ds;
  NotificationRepositoryImpl({@required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Notification> addNotification(String body, String type, String toUserId, String fromUserId, [String itemId]) async {
    final params = Notification.createParams(
      body: body, type: type, toUserId: toUserId, fromUserId: fromUserId, itemId: itemId
    );
    return Notification.fromJson(await _ds.addNotification(params));
  }

  @override
  Future<List<Notification>> getNotifications({String userId, Notification lastItem}) async {
  }
}
