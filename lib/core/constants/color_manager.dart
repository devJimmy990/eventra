import 'package:flutter/material.dart';

class ColorManager {
  // Main theme colors
  static const Color purpleColor = Color(0xff5669FD); // Primary theme color (AppBar, Buttons, Icons, Text Highlights)
  static const Color darkPurpleColor = Color(0xff2e3883); // Darker shade of purple (Used in Text)
  static const Color cyanColor = Color(0xff00f6fd); // Accent/Secondary color
  static const Color bgColor = Color(0xffdeefef); // Light theme background color
  static const Color buttonColor = Color(0xff606CF6); // Primary button background color
  static const Color blackColor = Colors.black; // Default black
  static const Color greyColor = Colors.grey; // General grey color (For disabled elements, borders, etc.)
  static const Color whiteColor = Colors.white; // White color for text/icons

  // App theme colors
  static const Color lightPrimary = Color(0xff5669fd); // Used as Primary color across Light and Dark theme
  static const Color darkPrimary = Color(0xFF1E2745); // Used as Primary color across Light and Dark theme
  static const Color sideBarLight = Color(0xFF1E2745); // Used as Primary color across Light and Dark theme
  static const Color secondary = Color(0xFF00F6FD); // Secondary/Accent color
  static const Color accent = Color(0xFFb0c7ff); // Another accent color (Might be used for hover effects, etc.)

  // Text colors
  static const Color textPrimaryLight = Color(0xFF000000); // Main text color in Light Theme
  static const Color textSecondaryLight = Color(0xFFE4E4E4); // Secondary text in Light Theme
  static const Color textPrimaryDark = Color(0xFFFDFDFD); // Main text color in Dark Theme
  static const Color textSecondaryDark = Color(0xFFE4E4E4); // Secondary text in Dark Theme
  static const Color textLocationDefault = Color(0xFF6F7183); // Default color for location/address text
  static const Color textWhite = Colors.white; // White text

  // AppBar Text Colors
  static const Color appBarTextLight = Color(0xFFFDFDFD); // Light theme AppBar text color
  static const Color appBarTextDark = Color(0xFFFDFDFD); // Dark theme AppBar text color

  // Background colors
  static const Color bgLight = Color(0xFFFBFBFB); // Background for Light Theme
  static const Color bgDark = Color(0xFF393948); // Background for Dark Theme
  static const Color scaffoldBackgroundLight = Color(0xFFFAFAFA); // Background for Dark Theme
  static const Color scaffoldBackgroundDark = Color(0xFF2D2D3A); // Background for Dark Theme
  static const Color primaryBackground = Color(0xFFF3F5FF); // Primary Background color for Containers

  // Background Container colors
  static const Color actionButton = Color(0xFF5669FD); // Light mode container color

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6); // Light mode container color
  static Color darkContainer = Color.fromRGBO(255, 255, 255, .1); // Dark mode container with transparency

  // Button colors
  static const Color buttonPrimaryLight = Color(0xFF4b68ff); // Light theme primary button color
  static const Color buttonSecondaryLight = Color(0xFFFDFDFD); // Light theme secondary button color
  static const Color buttonPrimaryDark = Color(0xFF5669FD); // Dark theme primary button color
  static const Color buttonSecondaryDark = Color(0xFFFDFDFD); // Dark theme secondary button color
  static const Color buttonDisabled = Color(0xFFC4C4C4); // Disabled button color

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9); // Primary border color
  static const Color borderSecondary = Color(0xFFE6E6E6); // Secondary border color

  // Icon colors
  static const Color iconLight = Color(0xFFECEEFD); // Light theme icons
  static const Color iconDark = Color(0xFF323452); // Dark theme icons

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F); // Error messages
  static const Color success = Color(0xFF388E3C); // Success messages
  static const Color warning = Color(0xFFF57C00); // Warning messages
  static const Color info = Color(0xFF1976D2); // Info messages

  // Neutral Shades
  static const Color black = Color(0xFF232323); // Almost black (used for text/icons)
  static const Color darkerGrey = Color(0xFF4F4F4F); // Dark grey shade
  static const Color darkGrey = Color(0xFF939393); // General grey
  static const Color grey = Color(0xFFE0E0E0); // Light grey (backgrounds, dividers, etc.)
  static const Color softGrey = Color(0xFFF4F4F4); // Soft grey background
  static const Color lightGrey = Color(0xFF393948); // Used in dark mode backgrounds
  static const Color white = Color(0xFFFFFFFF); // Pure white

  // Test Colors (Possibly for animations or testing UI elements)
  static const Color backgroundColor2 = Color(0xFF17203A); // Dark Blue shade for testing backgrounds
}