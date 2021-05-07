

// 麻雀牌の種類と画像の紐付け
import 'package:flutter/material.dart';

Map<String, String> mjMap = {
  "一索" : "assets/s1.png",
  "二索" : "assets/s2.png",
  "三索" : "assets/s3.png",
  "四索" : "assets/s4.png",
  "五索" : "assets/s5.png",
  "六索" : "assets/s6.png",
  "七索" : "assets/s7.png",
  "八索" : "assets/s8.png",
  "九索" : "assets/s9.png",
  "一萬" : "assets/m1.png",
  "二萬" : "assets/m2.png",
  "三萬" : "assets/m3.png",
  "四萬" : "assets/m4.png",
  "五萬" : "assets/m5.png",
  "六萬" : "assets/m6.png",
  "七萬" : "assets/m7.png",
  "八萬" : "assets/m8.png",
  "九萬" : "assets/m9.png",
  "一筒" : "assets/p1.png",
  "二筒" : "assets/p2.png",
  "三筒" : "assets/p3.png",
  "四筒" : "assets/p4.png",
  "五筒" : "assets/p5.png",
  "六筒" : "assets/p6.png",
  "七筒" : "assets/p7.png",
  "八筒" : "assets/p8.png",
  "九筒" : "assets/p9.png",
  "東" : "assets/ton.png",
  "南" : "assets/nan.png",
  "西" : "assets/sya.png",
  "北" : "assets/pei.png",
  "白" : "assets/hak.png",
  "發" : "assets/hat.png",
  "中" : "assets/chu.png",
};

Widget mjImage(String name) {
  String value = mjMap[name];
  return Image.asset(value);
}
