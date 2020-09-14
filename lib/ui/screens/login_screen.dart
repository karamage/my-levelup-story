import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/auth_provider.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/auth_view_model.dart';
import 'package:my_levelup_story/ui/viewmodels/my_user_view_model.dart';
import 'package:my_levelup_story/util/loading_dialog.dart';
/*
import 'package:provider/provider.dart';

import 'package:safely/common/LocalStorageManager.dart';
import 'package:safely/providers/app_state_model.dart';
import 'package:safely/models/app_state_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safely/models/user.dart';
import 'package:safely/common/loading_dialog.dart';
import 'package:safely/widgets/custom_app_bar.dart';

import 'package:safely/common/service_terms_dialog.dart';
import 'package:safely/common/alert_dialog_manager.dart';
*/

/*
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
*/

class LoginScreen extends HookWidget {
  final userNameController = useTextEditingController();

  /*
  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
  */

  void onStart(AuthViewModel authViewModel, MyUserViewModel myUserViewModel, BuildContext context) async {
    /*
    final String name = userNameController.text;
    if (name == "") {
      AlertDialogManager.showAlertDialog(context, "エラー", "ニックネームを入力してください");
      return;
    }
    ServiceTermsDialog.show(context, startRegist);
    */
    LoadingDialog.showLoading(context);
    final user = await authViewModel.login();
    LoadingDialog.hideLoading(context);
    if (user == null) return;
    final String nickname = userNameController.text;
    print("login ok uuid=${user.id} name=${nickname} ");
    myUserViewModel.addUser(user.id, nickname);
  }

  void startRegist(args) async {
    /*
    Navigator.pop(context); // 先に利用規約ダイアログを閉じる
    registUser(args);
     */
  }

  void registUser(args) async {
    /*
    final String name = userNameController.text;
    AppStateModel vm = Provider.of<AppStateModel>(context, listen: false);
    LoadingDialog.showLoading(context);
    FirebaseUser fuser = await vm.signInAnonymous();
    print('fuser.uid = ${fuser.uid}');
    User user = await vm.addUser(fuser.uid, name, "");
    LoadingDialog.hideLoading(context);
    print('user.id = ${user.id}');
    if (user == null) return;
    await LocalStorageManager.setMyUserId(user.id);
    await LocalStorageManager.setMyName(user.nickname);
    vm.setAppState(AppStateType.loginCompleted);

     */
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authProvider);
    final myUserViewModel = useProvider(myUserProvider);
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
                      onStart(authViewModel, myUserViewModel, context);
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
