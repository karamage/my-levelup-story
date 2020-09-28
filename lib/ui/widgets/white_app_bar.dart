import 'package:flutter/material.dart';

class WhiteAppBar {
  static Widget build(String title, [List<Widget> actions]) {
    return AppBar(
      title: Text(title,
          style: TextStyle(color: Colors.grey)
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: actions,
      iconTheme: IconThemeData(color: Colors.grey),
    );
  }
}
