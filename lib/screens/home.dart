import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackaton/screens/place.dart';
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
                    onTap: () {},
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
                    onTap: () {},
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
                    onTap: () {},
                    child: const Icon(
                      MdiIcons.accountOutline,
                      color: Colors.black54,
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                  snap: true,
                  snapSizes: const [0.05, 0.25, 1.0],
                  minChildSize: 0.05,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Stack(
                            children: [
                              Image.network('https://picsum.photos/1280/720'),
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
                                bottom: 20,
                                child: Text(
                                    "hdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdh",
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                ),
                              ),
                              Positioned(
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 100,
                                    height: 5,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
