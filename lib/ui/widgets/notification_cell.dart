import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/notification.dart' as n;
import 'package:my_levelup_story/ui/widgets/user_avator.dart';
import 'package:my_levelup_story/util/date_util.dart';

class NotificationCell extends StatelessWidget {
  final n.Notification item;
  final Future<void> Function(n.Notification item) tapNotification;

  NotificationCell(this.item, this.tapNotification);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(item.id),
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: item.isReaded ? Color.fromRGBO(220, 220, 220, 1.0) : Colors.white,
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
          ),
        ),
        child: _buildContents(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMainContents(context),
        ],
      ),
    );
  }

  Widget _buildMainContents(BuildContext context) {
    return ListTile(
      onTap: () {
        tapNotification(item);
      },
      leading: UserAvator(user: item.fromUser),
      title: Text(item.body),
      trailing: Text(DateUtil.mmdd(item.createdAt)),
    );
  }
}
