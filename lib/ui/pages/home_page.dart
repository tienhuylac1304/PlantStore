import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Plant Store")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "🌱 Sản phẩm nổi bật",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              // 👉 Điều hướng sang chi tiết sản phẩm
              Navigator.pushNamed(
                context,
                '/product',
                arguments: "Cây sen đá mini",
              );
            },
            child: Card(
              child: ListTile(
                leading: const Icon(
                  Icons.local_florist,
                  size: 40,
                  color: Colors.green,
                ),
                title: const Text("Cây sen đá mini"),
                subtitle: const Text("Giá: 50,000đ"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
