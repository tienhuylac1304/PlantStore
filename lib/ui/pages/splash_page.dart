import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plant_store/commons/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> requestWifiPermission() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      debugPrint("✅ Được phép truy cập Wi-Fi (cần location để quét Wi-Fi)");
    } else if (status.isDenied) {
      debugPrint("❌ Người dùng từ chối");
    } else if (status.isPermanentlyDenied) {
      debugPrint("⚠️ Người dùng từ chối vĩnh viễn, mở cài đặt...");
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();

    // 1. Gọi xin quyền
    requestWifiPermission();

    // 2. Chuyển sang màn hình chính sau 2 giây
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_florist, size: 100, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              "Plant Store",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
