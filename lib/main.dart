import 'package:flutter/material.dart';
import 'package:plant_store/ui/component/app_bottom_navigation.dart';
import 'package:plant_store/ui/pages/plant_detail_page.dart';

void main() {
  runApp(const PlantStoreApp());
}

class PlantStoreApp extends StatelessWidget {
  const PlantStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plant Store",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavigation(),
        '/product': (context) => const ProductDetailPage(),
      },
    );
  }
}
