import 'package:flutter/material.dart';
import 'package:my_levelup_story/data/models/item.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';

class CommentsScreen extends StatelessWidget {
  final Item item;
  CommentsScreen({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar.build("コメント"),
      body: Container(child: Text("コメント")),
    );
  }
}