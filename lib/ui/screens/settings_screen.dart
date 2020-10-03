import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/providers/my_user_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/my_user_view_model.dart';
import 'package:my_levelup_story/ui/widgets/input_forms_view.dart';
import 'package:my_levelup_story/ui/widgets/space_box.dart';
import 'package:my_levelup_story/ui/widgets/user_avator.dart';
import 'package:my_levelup_story/util/loading_dialog.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final myUser = useProvider(myUserProvider.state);
    final myUserVM = useProvider(myUserProvider);
    final nameController = useTextEditingController();
    final descController = useTextEditingController();
    nameController.text = myUser?.nickname ?? "";
    descController.text = myUser?.desc ?? "";
    useEffect((){
      () async {
        await myUserVM.reload();
      }();
      return null;
    }, []);
    return InputFormsView(
      children: [
        _buildMyProfile(context, myUser, myUserVM, nameController, descController),
      ],
    );
  }

  onSave(
      BuildContext context,
      MyUserViewModel myUserVM,
      TextEditingController nameController,
      TextEditingController descController
      ) async {
    print("onSave start");
    LoadingDialog.showLoading(context);
    await myUserVM.updateUserSettings(nameController.text, descController.text);
    LoadingDialog.hideLoading(context);
    print("onSave end");
  }

  Widget _buildMyProfile(
      BuildContext context,
      User myUser,
      MyUserViewModel myUserVM,
      TextEditingController nameController,
      TextEditingController descController
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: UserAvator(user: myUser)),
        FlatButton(
          child: Text("アイコン設定"),
          onPressed: () {
            print("onPressed icon setting.");
          },
          textColor: Theme.of(context).primaryColor,
        ),
        Divider(),
        //SpaceBox(height: 16.0),
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
          maxLength: 80,
          decoration: InputDecoration(
              labelText: "自己紹介",
              hintText: "自己紹介を入力してください"
          ),
        ),
        RaisedButton(
          child: Text("保存する"),
          onPressed: () => onSave(context, myUserVM, nameController, descController),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
