import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';

class BackButtonFixed extends StatelessWidget {
  const BackButtonFixed({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: SafeArea(
        child: Material(
          color: AppColors.backgroundLight.withAlpha(77),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.arrow_back, color: AppColors.backgroundLight),
            ),
          ),
        ),
      ),
    );
  }
}