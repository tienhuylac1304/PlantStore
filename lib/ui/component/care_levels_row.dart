import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//linear progress bar
class CareLevelsRow extends StatelessWidget {
  final int waterLevel; // 0..5
  final int lightLevel; // 0..5

  const CareLevelsRow({
    super.key,
    required this.waterLevel,
    required this.lightLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LevelBarWithLabel(
            label: AppLocalizations.of(context)!.water,
            value: waterLevel / 5.0,
            valueText: "$waterLevel/5",
            color: AppColors.waterColors,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: LevelBarWithLabel(
            label:AppLocalizations.of(context)!.light,
            value: lightLevel / 5.0,
            valueText: "$lightLevel/5",
            color: AppColors.lightColors,
          ),
        ),
      ],
    );
  }
}
//label
class LevelBarWithLabel extends StatelessWidget {
  final String label;
  final double value; // 0.0..1.0
  final String valueText; // ví dụ "3/5"
  final Color color;

  const LevelBarWithLabel({
    super.key,
    required this.label,
    required this.value,
    required this.valueText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: textTheme.bodyMedium),
            const Spacer(),
            Text(valueText, style: textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: value.clamp(0.0, 1.0),
            minHeight: 10,
            color: color,
            backgroundColor: color.withAlpha(33),
            semanticsLabel: label,
          ),
        ),
      ],
    );
  }
}