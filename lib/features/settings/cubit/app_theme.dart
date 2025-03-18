import 'package:eventra/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // Light Theme Configuration
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    // Main primary color
    colorScheme: const ColorScheme.light(
      primary: ColorManager.textPrimaryLight,
      // Used for main text color in light theme
      secondary: ColorManager.textSecondaryLight,
      // Used for secondary text
      surface: ColorManager.bgLight,
      // Background surface color
      error: ColorManager.error, // Error messages
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ColorManager.textPrimaryLight, // Active tab text color
      unselectedLabelColor: ColorManager.primary, // Inactive tab text color
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ColorManager.primary, // Active tab underline color
          width: 2.0,
        ),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.actionButton, // FAB background color
      foregroundColor: ColorManager.textPrimaryLight, // FAB icon color
    ),
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundLight,
    // Background of the entire app
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary, // Status Bar color
        // Affects iOS status bar text color
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.white,
      ),
      color: ColorManager.primary, // AppBar background color
      iconTheme: IconThemeData(color: ColorManager.white), // AppBar icons
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          color: ColorManager.textPrimaryLight, // Large titles (Headings)
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: ColorManager.textPrimaryLight, // Medium-sized headings
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: ColorManager.textPrimaryLight, // Small titles
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: ColorManager.textSecondaryLight,
          // Small labels (Buttons, captions, etc.)
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
            color: ColorManager.textSecondaryLight, // Medium labels
            fontSize: 16.sp,
            fontWeight: FontWeight.w400)),
  );

  // Dark Theme Configuration
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.primary,
    // Primary color remains the same
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.textPrimaryDark,
      // Main text color for dark theme
      secondary: ColorManager.textSecondaryDark,
      // Secondary text color
      surface: ColorManager.bgDark,
      // Background surface color
      error: ColorManager.error, // Error messages
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ColorManager.textPrimaryLight, // Active tab text color
      unselectedLabelColor: ColorManager.primary, // Inactive tab text color
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ColorManager.primary, // Active tab underline color
          width: 2.0,
        ),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.actionButton, // FAB background color
      foregroundColor: ColorManager.white, // FAB icon color
    ),

    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundDark,
    // Background for the entire app
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary, // Status Bar color
        statusBarIconBrightness: Brightness.light, // Icons for Light status bar
        statusBarBrightness:
            Brightness.dark, // Affects iOS status bar text color
      ),
      color: ColorManager.primary, // AppBar background color in dark mode
      iconTheme: IconThemeData(color: Colors.white), // AppBar icons
    ),
    inputDecorationTheme: InputDecorationTheme(),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          color: ColorManager.textPrimaryDark, // Large titles (Headings)
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: ColorManager.textPrimaryDark, // Medium-sized headings
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: ColorManager.textPrimaryDark, // Small titles
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: ColorManager.textSecondaryDark,
          // Small labels (Buttons, captions, etc.)
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
            color: ColorManager.textSecondaryDark, // Medium labels
            fontSize: 16.sp,
            fontWeight: FontWeight.w400)),
  );
}
