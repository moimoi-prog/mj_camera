import 'dart:io';
import 'dart:math';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:intl/intl.dart';

// -----------------------------------------
// フォーマットを指定して日付を取得する
// -----------------------------------------
String getFormattedDate(String format, [DateTime date]) {
  // 日付が指定されていない場合、現在の日付を指定
  if (date == null) {
    date = new DateTime.now();
  }

  // フォーマットを生成
  var formatter = new DateFormat(format);

  // 日付を整形
  String formatted = formatter.format(date);

  // リターン
  return formatted;

}

// -----------------------------------------
// 引数で指定した時刻と現在時刻の距離を判定する
// -----------------------------------------
String getPassDate(DateTime date) {
  //　時刻の差分を取得する
  DateTime now = DateTime.now();
  Duration difference = now.difference(date);

  final int years = (difference.inDays / 365).floor();
  final int days = difference.inDays;
  final int hours = difference.inHours;
  final int minutes = difference.inMinutes;

  if (years > 0) {
    return "$years年前";
  }

  if (days > 6) {
    return "$days日前";
  }

  if (days > 0) {
    return getFormattedDate("yyyy/MM/dd", date);
  }

  if (hours > 0) {
    return "$hours時間前";
  }

  if (minutes > 0) {
    return "$minutes分前";
  }

  return "いまさっき";

}

// -----------------------------------------
// 画像を圧縮する(ファイルで指定)
// -----------------------------------------
Future<File> imageCompression(File file, int width, int height) async {
  File ret = await FlutterNativeImage.compressImage(
      file.path,
      quality: 80,
      targetWidth: width,
      targetHeight: height
  );

  return ret;
}

// -----------------------------------------
// 画像を圧縮する(パスで指定
// -----------------------------------------
Future<File> imageCompressionToPath(String path, int width, int height) async {
  File ret = await FlutterNativeImage.compressImage(
      path,
      quality: 80,
      targetWidth: width,
      targetHeight: height
  );

  return ret;
}

// -----------------------------------------
// ランダムな文字列を生成する
// -----------------------------------------
String randomString(int length) {
  const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const _charsLength = _randomChars.length;

  final rand = new Random();
  final codeUnits = new List.generate(
    length,
        (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);
    },
  );
  return new String.fromCharCodes(codeUnits);
}


