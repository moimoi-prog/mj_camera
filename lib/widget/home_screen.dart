import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mj_camera/module/camera_module.dart';
import 'package:mj_camera/module/mj_module.dart';

import 'loading_dialog.dart';
import 'mj_card_widget.dart';

// --------------------------------------------
// ホーム画面クラス
// --------------------------------------------
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// --------------------------------------------
// ホーム画面ステータスクラス
// --------------------------------------------
class _HomeScreenState extends State<HomeScreen> {
  Widget result = Text("麻雀牌の画像を選択してください");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('麻雀カメラ'),
        actions: [
          // カメラ撮影用ボタン
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () async {
              // 判定する画像をカメラで撮影する
              File image = await getAndSaveImageFromDevice(ImageSource.camera);

              // 処理中ダイアログの表示
              showLoadingDialog(context);

              // 画像を取得できた場合、判定処理を行う
              if (image != null) {

                // WebAPIを用いて画像の判定処理を実行する
                Response res = await postExecute(image);

                if (res.statusCode == 200) {
                  // 正常に判定処理を終了した場合、結果を表示する
                  List haiNameList = res.body.split(", ");
                  List<Widget> haiWidgetList = [];

                  for (int index = 0; index < haiNameList.length - 1; index++) {
                    haiWidgetList.add(mjImage(haiNameList[index]));
                  }

                  result = Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: haiWidgetList,
                      ),
                    ),
                  );
                } else {
                  // 異常終了した場合、メッセージを表示する
                  result = Text("読み取りエラーが発生しました。もう一度読み取り直してください");
                }

                // 画面を更新
                setState(() {});
              }

              // 処理中ダイアログの削除
              Navigator.of(context).pop();
            },
          ),

          // 画像洗濯用ボタン
          IconButton(
            icon: Icon(Icons.photo_library_outlined),
            onPressed: () async {
              // 判定する画像をカメラで撮影する
              File image = await getAndSaveImageFromDevice(ImageSource.gallery);

              // 処理中ダイアログの表示
              showLoadingDialog(context);

              // 画像を取得できた場合、判定処理を行う
              if (image != null) {

                // WebAPIを用いて画像の判定処理を実行する
                Response res = await postExecute(image);

                if (res.statusCode == 200) {
                  // 正常に判定処理を終了した場合、結果を表示する
                  List haiNameList = res.body.split(", ");
                  List<Widget> haiWidgetList = [];

                  for (int index = 0; index < haiNameList.length - 1; index++) {
                    haiWidgetList.add(mjImage(haiNameList[index]));
                  }

                  result = Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: haiWidgetList,
                      ),
                    ),
                  );
                } else {
                  // 異常終了した場合、メッセージを表示する
                  result = Text("読み取りエラーが発生しました。もう一度読み取り直してください");
                }

                // 画面を更新
                setState(() {});
              }

              // 処理中ダイアログの削除
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            result,
          ],
        ),
      ),
    );
  }
}
