import 'package:flutter/material.dart';

import 'app_theme_color.dart';

class AppTheme {
  const AppTheme._();

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kLightPrimaryColor,
    scaffoldBackgroundColor: kLightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: kLightPrimaryColor,
      foregroundColor: kLightBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: kLightSecondaryColor),
      titleTextStyle: TextStyle(
        color: kLightSecondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kLightSecondaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kLightPrimaryColor,
        foregroundColor: kLightSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kLightSecondaryColor,
      foregroundColor: kLightPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: kLightSecondaryColor),
    colorScheme: const ColorScheme.light(
      primary: kLightPrimaryColor,
      secondary: kLightSecondaryColor,
      surface: kLightBackgroundColor,
      onPrimary: kLightOnPrimaryColor,
      onSecondary: kLightOnSecondaryColor,
      onSurface: kLightOnSurfaceColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: kLightPrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: kLightSecondaryColor,
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kDarkPrimaryColor,
    scaffoldBackgroundColor: kDarkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkPrimaryColor,
      foregroundColor: kDarkOnPrimaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: kDarkSecondaryColor),
      titleTextStyle: TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kDarkSecondaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkPrimaryColor,
        foregroundColor: kDarkSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kDarkSecondaryColor,
      foregroundColor: kDarkPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: kDarkSecondaryColor),
    colorScheme: const ColorScheme.dark(
      primary: kDarkPrimaryColor,
      secondary: kDarkSecondaryColor,
      surface: kDarkOnSurfaceColor,
      onPrimary: kDarkOnPrimaryColor,
      onSecondary: kDarkOnSecondaryColor,
      onSurface: kDarkOnSurfaceColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: kDarkPrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: kDarkSecondaryColor,
      ),
    ),
  );
}
