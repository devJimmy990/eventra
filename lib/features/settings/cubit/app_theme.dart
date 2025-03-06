import 'package:eventra/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.bgColor,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: ColorManager.purpleColor
      ),
        iconTheme: IconThemeData(
            color: ColorManager.purpleColor
        )
    ),
    useMaterial3: true,
    textTheme:  TextTheme(
        titleLarge: TextStyle(
          color: ColorManager.purpleColor,
          fontSize: 36.sp,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: ColorManager.darkPurpleColor,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,),
        titleSmall: TextStyle(
          color: ColorManager.purpleColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold
          ,),
        labelMedium: TextStyle(
            color: ColorManager.darkPurpleColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400
        )
    ),
  );
}