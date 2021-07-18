import 'package:flutter/material.dart';

class ButtonThemeContants {
  ButtonThemeContants._internal();

  static final ButtonThemeContants _instance = ButtonThemeContants._internal();

  static ButtonThemeContants get instance => _instance;

  ButtonStyle rectangeButtonStyle({required Color color}) => ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero));
}
