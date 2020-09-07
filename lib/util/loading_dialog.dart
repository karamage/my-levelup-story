import 'package:flutter/material.dart';

class LoadingDialog {
  // 全画面ローディングダイアログ
  static showLoading(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (ctx, animation, sanimation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  static hideLoading(BuildContext context) {
    NavigatorState navState = Navigator.of(context);
    navState.pop();
  }
}
