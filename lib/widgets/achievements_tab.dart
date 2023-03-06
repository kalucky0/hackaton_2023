import 'dart:math';

import 'package:flutter/material.dart';

class AchievementModel {
  final String name;
  final String icon;
  final Color color;

  const AchievementModel({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class AchievementsTab extends StatelessWidget {
  const AchievementsTab({Key? key}) : super(key: key);

  static const achievements = [
    AchievementModel(
      // name: 'New Yorker',
      name: 'Nowojorczyk',
      icon: 'https://img.icons8.com/fluency/256/new-york.png',
      color: Color(0xFF35c2ef),
    ),
    AchievementModel(
      // name: 'Art Lover',
      name: 'Miłośnik sztuki',
      icon: 'https://img.icons8.com/fluency/256/easel.png',
      color: Color(0xFF50e6fe),
    ),
    AchievementModel(
      // name: 'Foodie',
      name: 'Łasuch',
      icon: 'https://img.icons8.com/fluency/256/food.png',
      color: Color(0xFF189ce4),
    ),
    AchievementModel(
      // name: 'Nature Lover',
      name: 'Miłośnik przyrody',
      icon: 'https://img.icons8.com/fluency/256/nature.png',
      color: Color(0xFF159b56),
    ),
    AchievementModel(
      // name: 'History Buff',
      name: 'Historyk',
      icon: 'https://img.icons8.com/fluency/256/greek-pillar-base.png',
      color: Color(0xFFa8bdc4),
    ),
    AchievementModel(
      // name: 'Oktoberfest Fan',
      name: 'Fan Oktoberfestu',
      icon: 'https://img.icons8.com/fluency/256/bavarian-beer-mug.png',
      color: Color(0xFFffc307),
    ),
    AchievementModel(
      // name: 'Hiker',
      name: 'Wędrowiec',
      icon: 'https://img.icons8.com/fluency/256/alps.png',
      color: Color(0xFF0b9a50),
    ),
    AchievementModel(
      // name: 'Contributor',
      name: 'Współtwórca',
      icon: 'https://img.icons8.com/fluency/256/pencil-tip.png',
      color: Color(0xFFedbe00),
    ),
    AchievementModel(
      // name: 'Explorer',
      name: 'Odkrywca',
      icon: 'https://img.icons8.com/fluency/256/compass.png',
      color: Color(0xFFfb4e14),
    ),
    AchievementModel(
      // name: 'Photographer',
      name: 'Fotograf',
      icon: 'https://img.icons8.com/fluency/256/camera.png',
      color: Color(0xFFba8eef),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: const Color(0xFFFAFAFA),
      child: GridView.builder(
        itemCount: achievements.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.98,
        ),
        itemBuilder: (context, index) {
          return _achievementBadge(
            context,
            achievements[index].name,
            achievements[index].icon,
            Random().nextInt(100),
            achievements[index].color,
          );
        },
      ),
    );
  }

  Widget _achievementBadge(BuildContext context, String name, String icon,
      int progress, Color color) {
    return Column(
      children: [
        CustomPaint(
          painter: PieChartPainter(
            value: progress,
            maxValue: 100,
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Image.network(
                icon,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  final int value;
  final int maxValue;
  final Color color;

  PieChartPainter({
    required this.value,
    required this.maxValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    double startAngle = -pi / 2;
    double endAngle = 0.0;

    double arcAngle = 2 * pi * value / maxValue;

    canvas.drawArc(
      rect,
      endAngle,
      2 * pi,
      true,
      Paint()..color = Colors.grey.withOpacity(0.2),
    );

    canvas.drawArc(
      rect,
      startAngle,
      arcAngle,
      true,
      Paint()..color = color,
    );

    startAngle = endAngle;
    endAngle += arcAngle;
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) {
    return value != oldDelegate.value || maxValue != oldDelegate.maxValue;
  }
}
