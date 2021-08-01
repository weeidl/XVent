import 'package:flutter/material.dart';

class XVentTextStyle {
  static TextStyle title1(Color color) {
    return TextStyle(
        fontFamily: 'SFPro',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: color);
  }

  static TextStyle title3(Color color) {
    return TextStyle(
        fontFamily: 'SFPro',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color);
  }

  static TextStyle title2(Color color) {
    return TextStyle(
      fontFamily: 'SFPro',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color,
      fontStyle: FontStyle.normal,
    );
  }
}
