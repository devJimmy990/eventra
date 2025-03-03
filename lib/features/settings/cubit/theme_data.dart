import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFB00020);

  static final ThemeData light = ThemeData.light(
    // brightness: Brightness.light,
    // primaryColor: primaryColor,
    // colorScheme: const ColorScheme.light(
    //   primary: primaryColor,
    //   secondary: secondaryColor,
    //   background: backgroundColor,
    //   surface: Colors.white,
    //   error: errorColor,
    // ),
    // scaffoldBackgroundColor: backgroundColor,
    // appBarTheme: const AppBarTheme(
    //   color: primaryColor,
    //   iconTheme: IconThemeData(color: Colors.white),
    // ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: textColor),
    //   bodyMedium: TextStyle(color: textColor),
    // ),
  );

  static final ThemeData dark = ThemeData.dark(
    // brightness: Brightness.dark,
    // primaryColor: primaryColor,
    // colorScheme: const ColorScheme.dark(
    //   primary: primaryColor,
    //   secondary: secondaryColor,
    //   background: Colors.black,
    //   surface: Colors.grey[900]!,
    //   error: errorColor,
    // ),
    // scaffoldBackgroundColor: Colors.grey[900],
    // appBarTheme: const AppBarTheme(
    //   color: primaryColor,
    //   iconTheme: IconThemeData(color: Colors.white),
    // ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.white),
    //   bodyMedium: TextStyle(color: Colors.white),
    // ),
  );
}