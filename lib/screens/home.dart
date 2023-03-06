import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackaton/screens/place.dart';
import 'package:hackaton/screens/profile.dart';
import 'package:hackaton/screens/route_creation.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cubits/home_cubit.dart';
import '../main.dart';
import '../widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  ),
                ),
                Positioned(
                  height: 50,
                  bottom: 20,
                  left: 20,
                  child: Button(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return const PlaceScreen();
                        },
                      );
                    },
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          MdiIcons.qrcodeScan,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Skanuj',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
                    child: const Icon(
                      MdiIcons.plus,
                      color: Colors.black54,
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
                          return const ProfileScreen();
                        },
                      );
                    },
                    child: const Icon(
                      MdiIcons.accountOutline,
                      color: Colors.black54,
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
