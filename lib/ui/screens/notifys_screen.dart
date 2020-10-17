import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/notification.dart' as n;
import 'package:my_levelup_story/data/providers/notifications_provider.dart';
import 'package:my_levelup_story/ui/widgets/easy_list_view.dart';
import 'package:my_levelup_story/ui/widgets/loading_indicator.dart';
import 'package:my_levelup_story/ui/widgets/notification_cell.dart';

class NotifysScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(notificationsProvider.state);
    final vm = useProvider(notificationsProvider);
    useEffect((){
      vm.reload();
      return null;
    }, []);
    return EasyListView(
      items: state.items,
      onRefresh: vm.onRefresh,
      onNext: vm.next,
      buildCells: (items) =>
          items.map((item) =>
              NotificationCell(
                item,
                tapNotification,
              )
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }

  Future<void> tapNotification(n.Notification item) {
    //画面遷移する
  }
}
