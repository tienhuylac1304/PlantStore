import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_store/model/plant.dart';

class NameFormatter {
  static String format(BuildContext context, Plant plant) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == "vi") {
      // Hiển thị VNĐ
      return plant.nameVn;
    } else {
      // Hiển thị USD
      return plant.name;
    }
  }
}
