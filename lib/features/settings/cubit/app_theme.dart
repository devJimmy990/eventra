import 'package:eventra/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    colorScheme: const ColorScheme.light(
      primary: ColorManager.textPrimaryLight,
      secondary: ColorManager.textSecondaryLight,
      // bottomSheetTheme:BottomSheetTheme.lightBottomSheetTheme ,
      surface: Colors.white,
      error: ColorManager.error,
    ),
    scaffoldBackgroundColor: ColorManager.bgLight,
    appBarTheme: const AppBarTheme(
      color: ColorManager.primary,
      iconTheme: IconThemeData(color: ColorManager.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorManager.textPrimaryLight),
      bodyMedium: TextStyle(color: ColorManager.textSecondaryLight),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.primary,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.textPrimaryDark,
      secondary: ColorManager.textSecondaryDark,
      // bottomSheetTheme:BottomSheetTheme.darkBottomSheetTheme ,

      surface: ColorManager.lightGrey,
      error: ColorManager.error,
    ),
    scaffoldBackgroundColor: ColorManager.lightGrey,
    appBarTheme: const AppBarTheme(
      color: ColorManager.primary,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorManager.textPrimaryDark),
      bodyMedium: TextStyle(color: ColorManager.textSecondaryDark),
    ),
  );
}