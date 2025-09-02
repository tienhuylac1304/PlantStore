import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextTheme lightTextTheme = TextTheme(
    //heading
    headlineLarge: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    //body
    bodyLarge: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 16,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 14,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    //label
    labelSmall: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 12,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textLight,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textLight,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 16,
      color: AppColors.textLight,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 14,
      color: AppColors.textLight,
      height: 1.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 12,
      color: AppColors.textLight,
      height: 1.5,
    ),
  );
}
