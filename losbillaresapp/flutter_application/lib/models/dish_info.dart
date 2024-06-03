import 'package:flutter/material.dart';

class DishInfo {
  late TextEditingController dishType;
  late TextEditingController dishName;
  late List<TextEditingController> dishDescriptions;
  late TextEditingController urlDishImage;

  DishInfo(String dishType, String dishName,
      List<String> dishStringDescriptions, String urlDishImage) {
    this.dishType = TextEditingController(text: dishType);
    this.dishName = TextEditingController(text: dishName);
    dishDescriptions = List.empty(growable: true);
    for (String description in dishStringDescriptions) {
      dishDescriptions.add(TextEditingController(text: description));
    }
    this.urlDishImage = TextEditingController(text: urlDishImage);
  }
}
