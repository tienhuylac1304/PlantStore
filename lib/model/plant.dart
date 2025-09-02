import 'dart:convert';

class Plant {
  final String id;
  final String name;
  final String nameVn;
  final String imageUrl;
  final int waterLevel; // 1-5
  final int lightLevel; // 1-5
  final double priceUsd;
  final int priceVnd;
  final int quantity;
  final bool isIndoor;
  final String? shortDescription;
  final String? longDescription;
  final bool isActive;
  final DateTime createdAt;

  Plant({
    required this.id,
    required this.name,
    required this.nameVn,
    required this.imageUrl,
    required this.waterLevel,
    required this.lightLevel,
    required this.priceUsd,
    required this.priceVnd,
    required this.quantity,
    required this.isIndoor,
    this.shortDescription,
    this.longDescription,
    required this.isActive,
    required this.createdAt,
  });

  /// Parse từ JSON (map Supabase trả về)
  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'] as String,
      name: json['name'] as String,
      nameVn: json['name_vi'] as String,
      imageUrl: json['image_url'] as String,
      waterLevel: json['water_level'] as int,
      lightLevel: json['light_level'] as int,
      priceUsd: (json['price_usd'] as num).toDouble(),
      priceVnd: json['price_vnd'] as int,
      quantity: json['quantity'] as int,
      isIndoor: json['is_indoor'] as bool,
      shortDescription: json['short_description'] as String?,
      longDescription: json['long_description'] as String?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  /// Convert object -> JSON (để insert/update vào Supabase)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_vi': nameVn,
      'image_url': imageUrl,
      'water_level': waterLevel,
      'light_level': lightLevel,
      'price_usd': priceUsd,
      'price_vnd': priceVnd,
      'quantity': quantity,
      'is_indoor': isIndoor,
      'short_description': shortDescription,
      'long_description': longDescription,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
