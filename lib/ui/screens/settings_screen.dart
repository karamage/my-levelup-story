import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/widgets/input_forms_view.dart';
import 'package:my_levelup_story/ui/widgets/space_box.dart';
import 'package:my_levelup_story/ui/widgets/user_avator.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final myUser = useProvider(myUserProvider.state);
    return InputFormsView(
      children: [
        _buildMyProfile(context, myUser),
      ],
    );
  }

  Widget _buildMyProfile(BuildContext context, User myUser) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: UserAvator(user: myUser)),
        /*
        FlatButton(
          child: Text("アイコン設定"),
          onPressed: () => onClickUploadUserImage(context),
          //color: Theme.of(context).primaryColor,
          //textColor: Colors.white,
          textColor: Theme.of(context).primaryColor,
        ),

        */
        Divider(),
        SpaceBox(height: 16.0),
        /*
        TextField(
          controller: nameController,
          maxLength: 16,
          decoration: InputDecoration(
              labelText: "ニックネーム",
              hintText: "お名前を入力してください"
          ),
        ),
        TextField(
          controller: descController,
          //maxLines: 2,
          maxLength: 80,
          //keyboardType: TextInputType.multiline,
          //textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
              labelText: "自己紹介",
              hintText: "自己紹介を入力してください"
          ),
        ),
        RaisedButton(
          child: Text("保存する"),
          onPressed: () => onClick(context),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ),
        */
      ],
    );
  }
}
