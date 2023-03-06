import 'package:flutter/painting.dart';

class AchievementModel {
  final String name;
  final String icon;
  final Color color;
  final String description;
  final int maxValue;

  const AchievementModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.maxValue,
  });
}
