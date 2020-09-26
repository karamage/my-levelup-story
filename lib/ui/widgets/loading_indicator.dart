import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: CircularProgressIndicator(),
    ));
  }
}
