import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';
import 'package:plant_store/commons/app_text_style.dart';
import 'package:plant_store/helper/description_format.dart';
import 'package:plant_store/helper/name_format.dart';
import 'package:plant_store/helper/price_format.dart';
import 'package:plant_store/model/plant.dart';
import 'package:plant_store/ui/pages/plant_detail_page.dart';

class ListViewPlantCard extends StatefulWidget {
  final Plant plant;

  const ListViewPlantCard({super.key, required this.plant});

  @override
  State<ListViewPlantCard> createState() => _ListViewPlantCardState();
}

class _ListViewPlantCardState extends State<ListViewPlantCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PlantDetailPage(plantId: widget.plant.id),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _PlantImage(imageUrl: widget.plant.imageUrl),
                const SizedBox(width: 12),
                Expanded(child: _PlantInfo(plant: widget.plant)),
                const SizedBox(width: 12),
                _PlantPrice(plant: widget.plant),
              ],
            ),
          ),
        ),

        // Icon trái tim
        Positioned(
          top: -8,
          right: -8,
          child: _FavoriteButton(
            isFavorite: isFavorite,
            onToggle: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? '${widget.plant.name} added to favorites!'
                        : '${widget.plant.name} removed from favorites!',
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Hiển thị ảnh
class _PlantImage extends StatelessWidget {
  final String imageUrl;

  const _PlantImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/plant.jpg',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

/// Hiển thị tên, mô tả, water/light level
/// Hiển thị tên, mô tả, water/light level
class _PlantInfo extends StatelessWidget {
  final Plant plant;

  const _PlantInfo({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          NameFormatter.format(context, plant),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 4),
        Text(
          DescriptionFormatter.formatShortDescription(context, plant),
          style: Theme.of(context).textTheme.labelSmall,
        ),

        const SizedBox(height: 6), // cách biệt với phần mô tả
        // Row chứa water + light
        Row(
          children: [
            // Water level
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.water_drop_sharp,
                  size: AppTextStyles.lightTextTheme.labelSmall?.fontSize ?? 12,
                  color:
                      index < plant.waterLevel
                          ? AppColors.waterColors
                          : Colors.grey.shade300,
                );
              }),
            ),
            SizedBox(width: 10), // cách biệt giữa water và light
            // Light level
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.wb_sunny,
                  size: AppTextStyles.lightTextTheme.labelSmall?.fontSize ?? 13,
                  color:
                      index < plant.lightLevel
                          ? AppColors.lightColors
                          : Colors.grey.shade300,
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

/// Hiển thị giá
class _PlantPrice extends StatelessWidget {
  final Plant plant;

  const _PlantPrice({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        PriceFormatter.format(context, plant),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

/// Icon trái tim (favorite toggle)
class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggle;

  const _FavoriteButton({required this.isFavorite, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(6),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 20,
          color: AppColors.accent,
        ),
      ),
    );
  }
}
