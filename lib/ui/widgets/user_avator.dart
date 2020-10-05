import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:tapable_circle_image_avator/tapable_circle_image_avator.dart';

class UserAvator extends StatelessWidget {
  final User user;
  final void Function(String) onTap;

  UserAvator({@required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapableCircleImageAvator(id:user.id, name:user.nickname ?? "", imageUrl:user.imageUrl, onTap: onTap);
  }
}
