import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cubits/home_cubit.dart';
import '../main.dart';
import '../widgets/button.dart';
import 'camera.dart';
import 'profile.dart';
import 'route_creation.dart';

class Category {
  final String name;
  final IconData icon;

  const Category({
    required this.name,
    required this.icon,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const categories = [
    Category(
      name: "Wszystkie",
      icon: MdiIcons.mapMarkerOutline,
    ),
    Category(
      name: "Zabytki",
      icon: MdiIcons.castle,
    ),
    Category(
      name: "Muzea",
      icon: MdiIcons.bankOutline,
    ),
    Category(
      name: "Natura",
      icon: MdiIcons.treeOutline,
    ),
    Category(
      name: "Restauracje",
      icon: MdiIcons.silverwareForkKnife,
    ),
    Category(
      name: "Kawiarnie",
      icon: MdiIcons.coffeeOutline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: MapboxMap(
                    accessToken: mapsAccessToken,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(50.061, 19.937),
                      zoom: 14.0,
                    ),
                    attributionButtonPosition:
                        AttributionButtonPosition.BottomRight,
                    attributionButtonMargins: const Point(30, 40),
                    logoViewMargins: const Point(30, 40),
                    onMapCreated: (c) => cubit.onMapCreated(c),
                  ),
                ),
                Positioned(
                  height: 50,
                  bottom: 20,
                  left: 20,
                  child: Button(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraScreen(),
                        ),
                      );
                    },
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.qrcodeScan,
                          color: Colors.black.withOpacity(.65),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Skanuj',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.65),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  height: 50,
                  bottom: 75,
                  left: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cubit = context.read<HomeCubit>();
                        final category = categories[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 20 : 0,
                            right: index == categories.length - 1 ? 20 : 10,
                          ),
                          child: GestureDetector(
                            onTap: () => cubit.setChip(index),
                            child: Chip(
                              backgroundColor: index == state.selectedChip
                                  ? const Color(0xFF37373C)
                                  : Colors.white,
                              label: Row(
                                children: [
                                  Icon(
                                    category.icon,
                                    color: index == state.selectedChip
                                        ? Colors.white
                                        : Colors.black.withOpacity(.65),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                      color: index == state.selectedChip
                                          ? Colors.white
                                          : Colors.black.withOpacity(.65),
                                      fontWeight: index == state.selectedChip
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // backgroundColor: Colors.white,
                              elevation: 4,
                              shadowColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  height: 45,
                  top: 20 + MediaQuery.of(context).padding.top,
                  left: 20,
                  child: Button(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return const RouteCreation();
                        },
                      );
                    },
                    width: 45,
                    height: 45,
                    child: Icon(
                      MdiIcons.plus,
                      color: Colors.black.withOpacity(.65),
                    ),
                  ),
                ),
                Positioned(
                  height: 45,
                  top: 20 + MediaQuery.of(context).padding.top,
                  right: 20,
                  child: Button(
                    width: 45,
                    height: 45,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return const ProfileScreen(
                            username: 'Andrzej',
                            points: 1533,
                            id: 2137,
                          );
                        },
                      );
                    },
                    child: Icon(
                      MdiIcons.accountOutline,
                      color: Colors.black.withOpacity(.65),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
