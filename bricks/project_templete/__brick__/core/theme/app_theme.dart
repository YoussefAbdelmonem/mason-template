import 'package:flutter/material.dart';

import 'dynamic_theme/colors.dart';
import 'dynamic_theme/themes_color.dart';

class ThemesManger {
  static ThemeData get appTheme {
    return ThemeData(
      fontFamily: 'Sans',
      scaffoldBackgroundColor:
          AppColors.additionalButtonColor, //Colors.grey.shade100,
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.background)),
      colorScheme: AppThemes().selectedSchema,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.white),
        overlayColor: MaterialStateProperty.all(AppColors.white),
        checkColor: MaterialStateProperty.all(AppColors.checkBoxTextColor),
        side: const BorderSide(
          color: AppColors.checkBoxTextColor,
        ),

      ),
    );
  }
}
