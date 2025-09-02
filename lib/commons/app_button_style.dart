import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppButtonStyles {
  // ElevatedButton
  static final elevatedLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );

  static final elevatedDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );

  // OutlinedButton
  static final outlinedLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.backgroundLight,
      side: const BorderSide(color: AppColors.backgroundLight, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );

  static final outlinedDark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.backgroundDark,
      side: const BorderSide(color: AppColors.backgroundDark, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );

  // TextButton
  static final textLight = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.accent,
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
  );

  static final textDark = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
  );
}
