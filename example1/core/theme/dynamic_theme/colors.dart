import 'package:flutter/material.dart';

import 'themes_color.dart';

enum AppThemeMode { primary, primaryDark, pink, blue, custom }

class AppColors {
  static const primaryColor = Color(0xFF057EE7);
  static const buttonColor = Color(0xFF074DB6);
  static const font = Color(0xFF20384B);
  static const Color white = Color(0xFFCBD1CE);
  static const Color whiteBackground = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF636363);
  static const Color buttonBorderColor = Color(0xFF5E84A3);
  static const Color tabBarColor = Color(0xFF20384B);
  static const Color tabBarColorUnSelected = Color(0xFF8CAAC5);
  static const Color dotColor = Color(0xFF334D64);
  static const Color bottomNav = Color(0xFFF8F8F8);
  static const Color additionalButtonColor = Color(0xFFF5F5F5);
  static const Color bottomNavIcon = Color(0xFFD9D9D9);
  static const Color bottomNavActiveIcon = Color(0xFF057EE7);
  static const Color checkBoxTextColor = Color(0xFF5E84A3);
  static const Color subTitleBlackColor = Color(0xB2000000);
  static const Color black = Color(0xFF000000);
  static AppThemes selectedTheme = AppThemes();
  static Color get primary => selectedTheme.selectedSchema.primary;
  static Color get onPrimary => selectedTheme.selectedSchema.onPrimary;

  static Color get secondary => selectedTheme.selectedSchema.secondary;
  static Color get secondaryContainer =>
      selectedTheme.selectedSchema.secondaryContainer;

  static Color get error => selectedTheme.selectedSchema.error;

  static Color get background => selectedTheme.selectedSchema.background;
  static Color get appBarBackground =>
      selectedTheme.selectedSchema.onBackground;
  static Color get surface => selectedTheme.selectedSchema.surface;

  static Color get shadow => selectedTheme.selectedSchema.shadow;
  static Color get outline => selectedTheme.selectedSchema.outline;

  static Color get brightnessColor =>
      selectedTheme.selectedSchema.brightnessColor;
  static Color get brightnessColorInv =>
      selectedTheme.selectedSchema.brightnessColorInverse;
  static Brightness get brightness => selectedTheme.selectedSchema.brightness;
}
