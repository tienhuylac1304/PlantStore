import 'package:flutter/material.dart';
import 'package:plant_store/model/plant.dart';

class DescriptionFormatter {
  static String formatLongDescription(BuildContext context, Plant plant) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == "vi") {
      return plant.longDescriptionVn??"";
    } else {
      // Hiển thị USD
      return plant.longDescription??"";
    }
  }
    static String formatShortDescription(BuildContext context, Plant plant) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == "vi") {
      return plant.shortDescriptionVn??"";
    } else {
      // Hiển thị USD
      return plant.shortDescription??"";
    }
  }
}
