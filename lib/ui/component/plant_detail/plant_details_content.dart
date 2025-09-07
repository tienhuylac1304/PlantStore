import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';
import 'package:plant_store/helper/description_format.dart';
import 'package:plant_store/helper/name_format.dart';
import 'package:plant_store/helper/price_format.dart';
import 'package:plant_store/model/plant.dart';
import 'package:plant_store/ui/component/care_levels_row.dart';

class PlantDetailContent extends StatelessWidget {
  final Plant plant;
  const PlantDetailContent({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 280,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              NameFormatter.format(context, plant),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              PriceFormatter.format(context, plant),
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            Text(
              DescriptionFormatter.formatLongDescription(context, plant),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CareLevelsRow(
              waterLevel: plant.waterLevel,
              lightLevel: plant.lightLevel,
            ),
          ],
        ),
      ),
    );
  }
}
