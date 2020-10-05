import 'package:flutter/material.dart';
import 'package:my_levelup_story/ui/widgets/white_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  final userId;
  ProfileScreen({@required this.userId});

  @override
  Widget build(BuildContext context) {
    print("ProfileScreen userId=$userId");
    return Scaffold(
      appBar: WhiteAppBar.build("プロフィール"),
      body: const Center(
        child: Text("profile"),
      ),
    );
  }
}
