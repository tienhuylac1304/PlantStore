import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';
import 'package:plant_store/commons/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomActionBar extends StatefulWidget {
  const BottomActionBar({super.key});

  @override
  State<BottomActionBar> createState() => _BottomActionBarState();
}

class _BottomActionBarState extends State<BottomActionBar> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    // 👉 Tùy bạn muốn lưu vào đâu:
    // - Gọi API Supabase để update
    // - Hoặc chỉ lưu local (SharedPreferences, Hive...)
    // Ví dụ giả lập:
    // await Supabase.instance.client
    //     .from('favorites')
    //     .insert({'plant_id': plantId, 'is_favorite': isFavorite});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: AppColors.backgroundLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Nút trái tim
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: toggleFavorite,
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.accent,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Buy it now
          Expanded(
            flex: 6,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // TODO: xử lý mua ngay
              },
              child: Text(
                AppLocalizations.of(context)!.buyNow,
                style: AppTextStyles.lightTextTheme.bodyMedium?.copyWith(
                  color: AppColors.backgroundLight,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Cart
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // TODO: xử lý thêm vào giỏ
              },
              child: const Icon(
                Icons.add_shopping_cart,
                color: AppColors.backgroundLight,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
