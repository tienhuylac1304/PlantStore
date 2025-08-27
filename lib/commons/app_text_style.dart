import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextTheme lightTextTheme = TextTheme(
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
    bodyLarge: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 16,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 14,
      color: AppColors.textSecondary,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 12,
      color: AppColors.textSecondary,
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
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 14,
      color: AppColors.textLight,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 12,
      color: AppColors.textLight,
    ),
  );
}
