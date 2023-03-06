import 'package:flutter/material.dart';

import '../screens/profile.dart';

class UserComment extends StatelessWidget {
  final String name;
  final int points;
  final int id;

  const UserComment({
    required this.name,
    required this.points,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 25,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return ProfileScreen(
                    username: name,
                    points: points,
                    id: id,
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              child: Image.network('https://picsum.photos/60/60?$id'),
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse auctor lectus a sapien blandit cursus ac ut ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam at ullamcorper arcu, non hendrerit lacus.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(.68),
                  ),
                  maxLines: 3,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
