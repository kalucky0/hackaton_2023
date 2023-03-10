import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cubits/route_creation_cubit.dart';
import '../main.dart';
import 'route_send.dart';

class RouteCreation extends StatelessWidget {
  const RouteCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: const [1.0],
      minChildSize: 0.8,
      initialChildSize: 1.0,
      builder: (BuildContext context, scrollController) {
        return BlocProvider(
          create: (context) => RouteCreationCubit(),
          child: BlocBuilder<RouteCreationCubit, RouteCreationState>(
            builder: (context, state) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: [
                  _formRoute(context, scrollController, state),
                  _pointsList(context, scrollController, state),
                  _formPlace(context, scrollController, state),
                ].toList()[state.tab],
              );
            },
          ),
        );
      },
    );
  }

  Widget _formRoute(BuildContext context, ScrollController scrollController,
      RouteCreationState state) {
    final cubit = context.read<RouteCreationCubit>();
    return Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 56,
                left: 20,
                right: 20,
              ),
              child: Text(
                "Stw??rz now?? tras??",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nazwa trasy",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 7,
                      maxLines: null,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        labelText: "Opis trasy",
                        labelStyle: TextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
              ),
              child: GestureDetector(
                onTap: () => cubit.getFile(),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(state.image?.path ?? '')),
                    ),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Icon(
                    MdiIcons.camera,
                    size: 80,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                cubit.setTab(1);
              },
              child: const Text(
                "Nast??pny krok",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _pointsList(BuildContext context, ScrollController scrollController,
      RouteCreationState state) {
    final cubit = context.read<RouteCreationCubit>();
    return Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 20,
                      right: 2,
                    ),
                    child: IconButton(
                      onPressed: () => cubit.setTab(0),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Text(
                      "Dodaj miejsca",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _placeCard(
                  context,
                  'Bazylika Mariacka',
                  'Rzymskokatolicka bazylika z rze??bionym o??tarzem i gotyck?? wie????...',
                  'https://lh3.googleusercontent.com/gps-proxy/ALm4wwkXSlNKl7pHIIyV3Hg6HBFtaFH7Pz8xLrCSx-ivjXwFwRToSXTtT0xB6alU3KyXOVBUe2dyjfLc6ds27Ooqzc_cNPZZivxdwOtOX3KsN57pAzUqFY7vfLOECnl16UWTIm1yC_nuG_Stt1Y0uL6gj3-Gk5bZrWjKv7wNsevdfyDUf1qJm0ZtRolF=w408-h271-k-no',
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 14,
                left: 12,
                right: 12,
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: const Icon(
                        MdiIcons.plus,
                        size: 60,
                        color: Colors.black26,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab(2),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dodaj nowe miejsce",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => const RouteSend(),
                    opaque: false,
                  ),
                );
              },
              child: const Text(
                "Zako??cz",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _placeCard(
      BuildContext context, String name, String description, String image) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
        left: 12,
        right: 12,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.network(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formPlace(BuildContext context, ScrollController scrollController,
      RouteCreationState state) {
    final cubit = context.read<RouteCreationCubit>();
    return Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 2,
                  ),
                  child: IconButton(
                    onPressed: () => cubit.setTab(1),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: Text(
                    "Dodaj nowe miejsce",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nazwa trasy",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 7,
                      maxLines: null,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        labelText: "Opis trasy",
                        labelStyle: TextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
              ),
              child: GestureDetector(
                onTap: () => cubit.getPlaceFile(0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        File(state.placesImages.isNotEmpty
                            ? state.placesImages[0]?.path ?? ''
                            : ''),
                      ),
                    ),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Icon(
                    MdiIcons.camera,
                    size: 80,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: MapboxMap(
                        accessToken: mapsAccessToken,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(50.061, 19.937),
                          zoom: 14.0,
                        ),
                        attributionButtonPosition:
                            AttributionButtonPosition.BottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 65,
                    left: MediaQuery.of(context).size.width / 2 - 30 - 20,
                    child: Image.asset(
                      "assets/pin.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                cubit.setTab(1);
              },
              child: const Text(
                "Dodaj",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
