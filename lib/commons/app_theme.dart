import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';
import 'app_button_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Rubik',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      // ignore: deprecated_member_use
      background: AppColors.backgroundLight,
      surface: AppColors.surfaceLight,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      // ignore: deprecated_member_use
      onBackground: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
    ),
    textTheme: AppTextStyles.lightTextTheme,
    elevatedButtonTheme: AppButtonStyles.elevated,
    outlinedButtonTheme: AppButtonStyles.outlined,
    textButtonTheme: AppButtonStyles.text,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: AppColors.textSecondary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Rubik',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      // ignore: deprecated_member_use
      background: AppColors.backgroundDark,
      surface: AppColors.surfaceDark,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      // ignore: deprecated_member_use
      onBackground: AppColors.textLight,
      onSurface: AppColors.textLight,
      error: AppColors.error,
    ),
    textTheme: AppTextStyles.darkTextTheme,
    elevatedButtonTheme: AppButtonStyles.elevated,
    outlinedButtonTheme: AppButtonStyles.outlined,
    textButtonTheme: AppButtonStyles.text,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textLight,
    ),
  );
}
