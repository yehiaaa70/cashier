import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary!,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
    brightness: Brightness.light,
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
