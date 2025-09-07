import 'package:flutter/material.dart';
import 'package:plant_store/model/plant.dart';
import 'package:plant_store/service/plant_service.dart';
import 'package:plant_store/ui/component/back_button.dart';
import 'package:plant_store/ui/component/plant_detail/bottom_action_bar.dart';
import 'package:plant_store/ui/component/plant_detail/chat_button.dart';
import 'package:plant_store/ui/component/plant_detail/header_section.dart';
import 'package:plant_store/ui/component/plant_detail/plant_details_content.dart';
import 'package:plant_store/ui/component/plant_detail/plant_image.dart';

class PlantDetailPage extends StatelessWidget {
  final String plantId;
  const PlantDetailPage({super.key, required this.plantId});

  @override
  Widget build(BuildContext context) {
    final apiService = PlantService();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const BottomActionBar(),
      body: FutureBuilder<Plant?>(
        future: apiService.fetchPlantDetail(plantId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Plant not found"));
          }

          final plant = snapshot.data!;

          return Stack(
            children: [
              Column(
                children: const [HeaderSection(), Expanded(child: SizedBox())],
              ),
              PlantImageCircle(url: plant.imageUrl), // ✅ truyền url từ API
              PlantDetailContent(plant: plant),
              const BackButtonFixed(),
              const ChatButtonFixed(),
            ],
          );
        },
      ),
    );
  }
}
