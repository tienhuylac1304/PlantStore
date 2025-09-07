import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_store/model/plant.dart';

class PriceFormatter {
  static String format(BuildContext context, Plant plant) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == "vi") {
      // Hiển thị VNĐ
      final formatter = NumberFormat.currency(locale: "vi_VN", symbol: "₫");
      return formatter.format(plant.priceVnd);
    } else {
      // Hiển thị USD
      final formatter = NumberFormat.currency(locale: "en_US", symbol: "\$");
      return formatter.format(plant.priceUsd);
    }
  }
}
