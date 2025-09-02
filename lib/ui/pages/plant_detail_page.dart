import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_text_style.dart';
import '../../commons/app_colors.dart';

class PlantDetailPage extends StatelessWidget {
  const PlantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,

      // Thanh hành động bên dưới
      bottomNavigationBar: const BottomActionBar(),

      body: SafeArea(
        child: Stack(
          children: [
            // Nội dung scroll
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PlantImageSection(),
                  PlantInfoSection(),
                  PlantDetailSection(),
                ],
              ),
            ),

            // Nút Back cố định
            const BackButtonFixed(),
          ],
        ),
      ),
    );
  }
}

//
// Widget con
//

// Ảnh sản phẩm
class PlantImageSection extends StatelessWidget {
  const PlantImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/plant.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Thông tin cơ bản
class PlantInfoSection extends StatelessWidget {
  const PlantInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sen Đá Mini",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Icon(
                Icons.favorite_border,
                color: AppColors.primary,
                size: AppTextStyles.lightTextTheme.headlineLarge?.fontSize,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "50.000đ",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Cây sen đá mini dễ chăm sóc, thích hợp để bàn làm việc hoặc trang trí phòng khách. "
            "Mang lại không gian xanh mát và ý nghĩa phong thủy tốt lành.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// Chi tiết sản phẩm
class PlantDetailSection extends StatelessWidget {
  const PlantDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text(
            "Chi tiết sản phẩm",
            style: Theme.of(  context).textTheme.headlineMedium
          ),
          SizedBox(height: 8),
          Text(
            "- Chiều cao: ~15 cm\n"
            "- Tưới nước: 2 lần/tuần\n"
            "- Ánh sáng: Nơi có ánh sáng nhẹ\n"
            "- Chậu gốm kèm theo",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Thanh nút dưới cùng
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        child: Row(
          children: [
            // Nút mua ngay (3 phần)
            Expanded(
              flex: 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Mua ngay!")));
                },
                child: const Text(
                  "Mua ngay",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Nút giỏ hàng (1 phần)
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đã thêm vào giỏ hàng!")),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.textLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nút back cố định
class BackButtonFixed extends StatelessWidget {
  const BackButtonFixed({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: SafeArea(
        child: Material(
          color: AppColors.secondary,
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
