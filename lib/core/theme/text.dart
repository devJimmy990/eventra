import 'package:flutter/material.dart';
import 'package:eventra/core/constants/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextTheme {
  static TextTheme get light => TextTheme(
        titleLarge: TextStyle(
          color: ColorManager.textPrimaryDark,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: ColorManager.textPrimaryDark,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: ColorManager.textPrimaryDark,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: ColorManager.textSecondaryDark,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: ColorManager.textSecondaryDark,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      );

  static TextTheme get dark => TextTheme(
        titleLarge: TextStyle(
          color: ColorManager.textPrimaryLight,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: ColorManager.textPrimaryLight,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: ColorManager.textPrimaryLight,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: ColorManager.textPrimaryLight,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: ColorManager.textPrimaryLight,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      );
}
