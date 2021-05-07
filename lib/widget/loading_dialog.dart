
import 'package:flutter/material.dart';

// -----------------------------------------
// APIに接続し判定処理を実行する
// -----------------------------------------
void showLoadingDialog(BuildContext context) async{
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(microseconds: 0),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
  );
}