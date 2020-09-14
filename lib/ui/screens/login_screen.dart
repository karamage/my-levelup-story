import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/app_state_type.dart';
import 'package:my_levelup_story/data/providers/app_state_provider.dart';
import 'package:my_levelup_story/data/providers/auth_provider.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/app_state_view_model.dart';
import 'package:my_levelup_story/ui/viewmodels/auth_view_model.dart';
import 'package:my_levelup_story/ui/viewmodels/my_user_view_model.dart';
import 'package:my_levelup_story/util/alert_dialog_manager.dart';
import 'package:my_levelup_story/util/loading_dialog.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';

class LoginScreen extends HookWidget {
  void onStart(AuthViewModel authViewModel, MyUserViewModel myUserViewModel, BuildContext context,
      TextEditingController userNameController, AppStateViewModel appStateViewModel) async {
    final String nickname = userNameController.text;
    if (nickname == "") {
      AlertDialogManager.showAlertDialog(context, "エラー", "ニックネームを入力してください");
      return;
    }
    LoadingDialog.showLoading(context);
    var user = await authViewModel.login();
    if (user == null) return;
    user = await myUserViewModel.addUser(user.id, nickname);
    LoadingDialog.hideLoading(context);
    if (user == null) return;
    await LocalStorageManager.setMyUserId(user.id);
    await LocalStorageManager.setMyName(user.nickname);
    await authViewModel.setIsLogined(true);
    await appStateViewModel.setAppStateType(AppStateType.loginCompleted);
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authProvider);
    final myUserViewModel = useProvider(myUserProvider);
    final appStateViewModel = useProvider(appStateProvider);
    final userNameController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('MyLevelUpStory Login')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  /*
                  Center(
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('images/icon.png'),
                    ),
                  ),
                  */
                  TextField(
                      //autofocus: true,
                      decoration: InputDecoration(
                          labelText: "ニックネーム",
                          hintText: "ニックネームを入力してください"
                      ),
                      controller: userNameController
                  ),
                  RaisedButton(
                    child: Text('はじめる'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      onStart(authViewModel, myUserViewModel, context, userNameController, appStateViewModel);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
