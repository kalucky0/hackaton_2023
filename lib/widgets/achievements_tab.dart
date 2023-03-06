import 'package:flutter/material.dart';

class AchievementModel {
  final String name;
  final String icon;

  const AchievementModel({
    required this.name,
    required this.icon,
  });
}

class AchievementsTab extends StatelessWidget {
  const AchievementsTab({Key? key}) : super(key: key);

  static const achievements = [
    AchievementModel(
      name: 'New Yorker',
      icon: 'https://img.icons8.com/fluency/256/new-york.png',
    ),
    AchievementModel(
      name: 'Art Lover',
      icon: 'https://img.icons8.com/fluency/256/easel.png',
    ),
    AchievementModel(
      name: 'Foodie',
      icon: 'https://img.icons8.com/fluency/256/food.png',
    ),
    AchievementModel(
      name: 'Nature Lover',
      icon: 'https://img.icons8.com/fluency/256/nature.png',
    ),
    AchievementModel(
      name: 'History Buff',
      icon: 'https://img.icons8.com/fluency/256/greek-pillar-base.png',
    ),
    AchievementModel(
      name: 'Oktoberfest Fan',
      icon: 'https://img.icons8.com/fluency/256/bavarian-beer-mug.png',
    ),
    AchievementModel(
      name: 'Hiker',
      icon: 'https://img.icons8.com/fluency/256/alps.png',
    ),
    AchievementModel(
      name: 'Contributor',
      icon: 'https://img.icons8.com/fluency/256/pencil-tip.png',
    ),
    AchievementModel(
      name: 'Explorer',
      icon: 'https://img.icons8.com/fluency/256/compass.png',
    ),
    AchievementModel(
      name: 'Photographer',
      icon: 'https://img.icons8.com/fluency/256/camera.png',
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
        ),
        itemBuilder: (context, index) {
          return _achievementBadge(
            context,
            achievements[index].name,
            achievements[index].icon,
          );
        },
      ),
    );
  }

  Widget _achievementBadge(BuildContext context, String name, String icon) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Image.network(
            icon,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 5,
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
