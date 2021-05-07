import 'dart:io';

import 'package:flutter/material.dart';
import "package:http/http.Dart" as http;
import 'package:http/http.dart';

// 麻雀牌種別判定WebAPIのURL
String pageUrl = "https://stark-dusk-54181.herokuapp.com/";

// -----------------------------------------
// APIに接続し判定処理を実行する
// -----------------------------------------
Future<Response> postExecute(File imageFile) async {
  var response = await http.post(
    pageUrl,
    headers: {"Content-Type": "application/octet-stream"},
    body: await imageFile.readAsBytes(),
  );

  return (response);
}
