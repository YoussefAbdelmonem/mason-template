import 'package:flutter/material.dart';

import 'colors_schema.dart';

class AppThemes {
  // singleton
  AppThemes._internal();
  static final AppThemes _instance = AppThemes._internal();
  factory AppThemes() => _instance;

  changeCustomScheme(String color, Brightness brightness) {
    final hexColors = int.parse(color, radix: 16);
    final Color colors = Color(hexColors);

    selectedSchema = const AppColorScheme().fromColor(colors, brightness);
  }

  changeBrightness(Brightness brightness) {
    selectedSchema =
        const AppColorScheme().fromColor(selectedSchema.primary, brightness);
  }

  AppColorScheme selectedSchema = const AppColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF057EE7),
    onPrimary: Color(0xffF3953F),
    secondary: Color(0xffBEBBFF),
    error: Color(0xffb00020),
    background: Colors.white,
    onBackground: Color(0xff160D5D),
    surface: Color(0xff1f222a),
    shadow: Color(0xff1f222a),
    outline: Color(0xFF636363),
  );
}
