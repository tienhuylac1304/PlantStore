import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';

class PlantImageCircle extends StatelessWidget {
  final String url;
  const PlantImageCircle({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.backgroundLight,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.backgroundLight,
            child: ClipOval(
              child: Image.network(
                url,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/logo.png",
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
