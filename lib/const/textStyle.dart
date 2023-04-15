import 'package:flutter/material.dart';

TextStyle TextStyleComponent (TextStyle font, {Color? color}) {
  return TextStyle(
    fontFamily: font.fontFamily,
    fontWeight: font.fontWeight,
    fontSize: font.fontSize,
    color: color ?? font.color,
    // color가 null이 아니면 color 그대로 사용
    // color가 null이면 font.color 사용.
  );
}