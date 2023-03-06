import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackaton/cubits/profile_cubit.dart';
import 'package:hackaton/widgets/achievements_tab.dart';
import 'package:hackaton/widgets/profile_tab.dart';
import 'package:hackaton/widgets/visited_tab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final int points;
  final int id;

  const ProfileScreen({
    required this.username,
    required this.points,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: const [1.0],
      minChildSize: 0.8,
      initialChildSize: 1.0,
      builder: (BuildContext context, scrollController) {
        return BlocProvider(
          create: (context) => ProfileCubit(),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
              final cubit = context.read<ProfileCubit>();
              return ListView(
                controller: scrollController,
                children: [
                  Stack(
                    children: [
                      Image.network('https://picsum.photos/1280/720?$id'),
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black54,
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 40,
                        right: 20,
                        child: Icon(
                          MdiIcons.pencilOutline,
                          color: Colors.white,
                        ),
                      ),
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Colors.white.withOpacity(.6),
                                  width: 5,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network(
                                  'https://picsum.photos/200/200?$id',
                                  width: 88,
                                  height: 88,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              username,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Poziom ${(1 + sqrt(points / 100)).floor()} • $points punktów",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(.87)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => cubit.setTab(0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Odwiedzone",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => cubit.setTab(1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Profil",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => cubit.setTab(2),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width / 3,
                          child: const Text(
                            "Osiągnięcia",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.grey.withOpacity(0.2),
                    height: 1,
                  ),
                  if (state.tab == 0) const VisitedTab(),
                  if (state.tab == 1) const ProfileTab(),
                  if (state.tab == 2) const AchievementsTab(),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
