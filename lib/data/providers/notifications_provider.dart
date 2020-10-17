import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/notification_repository_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/notifications_view_model.dart';

final notificationsProvider = StateNotifierProvider.autoDispose((ref) =>
    NotificationsViewModel(
        ref.read(notificationRepositoryProvider)
    )
);
