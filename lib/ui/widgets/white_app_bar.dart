import 'package:flutter/material.dart';

class WhiteAppBar extends AppBar {
  final String text;
  final List<Widget> actions;

  WhiteAppBar({@required this.text, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,
          style: TextStyle(color: Colors.grey)
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: actions,
    );
  }
}
