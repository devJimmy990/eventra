import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventra/core/theme/text.dart';
import 'package:eventra/core/theme/input.dart';
import 'package:eventra/core/constants/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: ColorManager.lightPrimary,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundLight,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorManager.lightPrimary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.secondary,
      onSecondary: ColorManager.black,
      surface: ColorManager.bgLight,
      onSurface: ColorManager.textPrimaryLight,
      error: ColorManager.error,
      onError: ColorManager.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.sideBarLight,
      foregroundColor: ColorManager.white,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.sideBarLight,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ColorManager.textPrimaryLight,
      unselectedLabelColor: ColorManager.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ColorManager.lightPrimary,
          width: 2.0,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.actionButton,
      foregroundColor: ColorManager.white,
    ),
    textTheme: MyTextTheme.light,
    inputDecorationTheme: MyInputFieldTheme.light,
  );

  static final ThemeData dark = ThemeData(
    primaryColor: ColorManager.darkPrimary,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.darkPrimary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.secondary,
      onSecondary: ColorManager.black,
      surface: ColorManager.bgDark,
      onSurface: ColorManager.textPrimaryDark,
      error: ColorManager.error,
      onError: ColorManager.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.sideBarLight,
      foregroundColor: ColorManager.white,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.sideBarLight,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        color: Colors.red,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorManager.darkPrimary),
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ColorManager.textPrimaryDark,
      unselectedLabelColor: ColorManager.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ColorManager.darkPrimary,
          width: 2.0,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.actionButton,
      foregroundColor: ColorManager.white,
    ),
    textTheme: MyTextTheme.dark,
    inputDecorationTheme: MyInputFieldTheme.dark,
  );
}
