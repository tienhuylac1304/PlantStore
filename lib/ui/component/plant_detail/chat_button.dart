import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';

class ChatButtonFixed extends StatelessWidget {
  const ChatButtonFixed({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: SafeArea(
        child: Material(
          color: AppColors.backgroundLight.withAlpha(77),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.chat, color: AppColors.backgroundLight),
            ),
          ),
        ),
      ),
    );
  }
}