import 'dart:math';

import 'package:flutter/material.dart';

import '../models/achievement_model.dart';

class AchievementsTab extends StatelessWidget {
  const AchievementsTab({Key? key}) : super(key: key);

  static const achievements = [
    AchievementModel(
      // name: 'New Yorker',
      name: 'Nowojorczyk',
      icon: 'https://img.icons8.com/fluency/256/new-york.png',
      color: Color(0xFF35c2ef),
      description:
          'Aby ukończyć to osiągnięcie, przejdź co najmniej dziesięć tras w Nowym Jorku.',
      maxValue: 10,
    ),
    AchievementModel(
      // name: 'Art Lover',
      name: 'Miłośnik sztuki',
      icon: 'https://img.icons8.com/fluency/256/easel.png',
      color: Color(0xFF50e6fe),
      description:
          'Aby ukończyć to osiągnięcie, przejdź co najmniej dziesięć tras po muzeach.',
      maxValue: 10,
    ),
    AchievementModel(
      // name: 'Foodie',
      name: 'Łasuch',
      icon: 'https://img.icons8.com/fluency/256/food.png',
      color: Color(0xFF189ce4),
      description:
          'Aby ukończyć to osiągnięcie, przejdź co najmniej dziesięć tras po restauracjach.',
      maxValue: 10,
    ),
    AchievementModel(
      // name: 'Nature Lover',
      name: 'Miłośnik przyrody',
      icon: 'https://img.icons8.com/fluency/256/nature.png',
      color: Color(0xFF159b56),
      description:
          'Aby ukończyć to osiągnięcie, przejdź co najmniej 15 kilometrów tras po parkach.',
      maxValue: 15,
    ),
    AchievementModel(
      // name: 'History Buff',
      name: 'Historyk',
      icon: 'https://img.icons8.com/fluency/256/greek-pillar-base.png',
      color: Color(0xFFa8bdc4),
      description:
          'Aby ukończyć to osiągnięcie, odwiedź co najmniej 20 zabytków.',
      maxValue: 20,
    ),
    AchievementModel(
      // name: 'Oktoberfest Fan',
      name: 'Fan Oktoberfestu',
      icon: 'https://img.icons8.com/fluency/256/bavarian-beer-mug.png',
      color: Color(0xFFffc307),
      description:
          'Aby ukończyć to osiągnięcie, przejdź co najmniej jedną trasę w okolicach Theresienwiese.',
      maxValue: 1,
    ),
    AchievementModel(
      // name: 'Hiker',
      name: 'Wędrowiec',
      icon: 'https://img.icons8.com/fluency/256/alps.png',
      color: Color(0xFF0b9a50),
      description:
          'Aby ukończyć to osiągnięcie, przejdź co najmniej 20 kilometrów tras po górach.',
      maxValue: 20,
    ),
    AchievementModel(
      // name: 'Contributor',
      name: 'Współtwórca',
      icon: 'https://img.icons8.com/fluency/256/pencil-tip.png',
      color: Color(0xFFedbe00),
      description: 'Aby ukończyć to osiągnięcie, stwórz co najmniej 10 tras.',
      maxValue: 10,
    ),
    AchievementModel(
      // name: 'Explorer',
      name: 'Odkrywca',
      icon: 'https://img.icons8.com/fluency/256/compass.png',
      color: Color(0xFFfb4e14),
      description:
          'Aby ukończyć to osiągnięcie, odwiedź co najmniej 20 miejsc z różnych kategorii.',
      maxValue: 20,
    ),
    AchievementModel(
      // name: 'Photographer',
      name: 'Fotograf',
      icon: 'https://img.icons8.com/fluency/256/camera.png',
      color: Color(0xFFba8eef),
      description: 'Aby ukończyć to osiągnięcie, zrób co najmniej 20 zdjęć.',
      maxValue: 20,
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
            achievements[index],
            Random().nextInt(achievements[index].maxValue) + 1,
          );
        },
      ),
    );
  }

  Widget _achievementBadge(
      BuildContext context, AchievementModel achievement, int progress) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    achievement.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(achievement.description),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$progress/${achievement.maxValue}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '${(progress / achievement.maxValue * 100).round()}%',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress / achievement.maxValue,
                      child: Container(
                        decoration: BoxDecoration(
                          color: achievement.color,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '+${achievement.maxValue * 100} XP',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          CustomPaint(
            painter: PieChartPainter(
              value: progress,
              maxValue: achievement.maxValue,
              color: achievement.color,
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
                  achievement.icon,
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
                  achievement.name,
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
      ),
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
