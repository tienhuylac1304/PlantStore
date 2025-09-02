import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_button_style.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Rubik',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.backgroundLight,
      surface: AppColors.surfaceLight,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onBackground: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
    ),
    textTheme: AppTextStyles.lightTextTheme,
    elevatedButtonTheme: AppButtonStyles.elevatedLight,
    outlinedButtonTheme: AppButtonStyles.outlinedLight,
    textButtonTheme: AppButtonStyles.textLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLight,
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: AppColors.primary,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor:
          AppColors.secondary, // background cho LinearProgressIndicator
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
      background: AppColors.backgroundDark,
      surface: AppColors.surfaceDark,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: AppColors.textLight,
      onSurface: AppColors.textLight,
      error: AppColors.error,
    ),
    textTheme: AppTextStyles.darkTextTheme,
    elevatedButtonTheme: AppButtonStyles.elevatedDark,
    outlinedButtonTheme: AppButtonStyles.outlinedDark,
    textButtonTheme: AppButtonStyles.textDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textLight,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor:
          AppColors.primary, // background cho LinearProgressIndicator
    ),
  );
}
