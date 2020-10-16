import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/data/repository/notification_repository.dart';
import 'package:my_levelup_story/data/repository/notification_repository_impl.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>(
        (ref) => NotificationRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
