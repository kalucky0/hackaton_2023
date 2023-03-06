import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  static const _points = [
    LatLng(50.086721, 19.994021),
    LatLng(50.085388, 19.997405),
    LatLng(50.083779, 19.995888),
    LatLng(50.082190, 19.997223),
  ];

  void setChip(int index) {
    emit(HomeUpdate(index));
  }

  Future<void> onMapCreated(MapboxMapController controller) async {
    await _loadSprite(controller, 'pin');
    await _loadSprite(controller, 'pin_gray');
    await _loadSprite(controller, 'dot');

    int i = 0;
    for (final point in _points) {
      i++;
      controller.addSymbol(
        SymbolOptions(
          geometry: point,
          iconImage: i > 2 ? 'pin' : 'pin_gray',
          iconSize: 0.33,
          iconOffset: const Offset(0, -50),
        ),
      );
    }

    controller.addLine(
      const LineOptions(
        geometry: _points,
        lineWidth: 3,
        linePattern: 'dot',
        lineOpacity: .33,
      ),
    );

    final marker = await controller.addCircle(const CircleOptions(
      geometry: LatLng(0, 0),
    ));
    _updateLocationMarker(controller, marker);

    Timer.periodic(const Duration(seconds: 10), (timer) async {
      _updateLocationMarker(controller, marker);
    });
  }

  Future<void> _updateLocationMarker(
      MapboxMapController controller, Circle marker) async {
    final position = await Geolocator.getCurrentPosition();
    controller.updateCircle(
      marker,
      CircleOptions(
        circleRadius: 6,
        circleColor: '#3197ed',
        circleStrokeColor: '#3197ed',
        circleStrokeOpacity: .5,
        circleStrokeWidth: 2,
        geometry: LatLng(position.latitude, position.longitude),
      ),
    );

    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ),
    );
  }

  Future<void> _loadSprite(MapboxMapController controller, String name) async {
    final ByteData bytes = await rootBundle.load("assets/$name.png");
    final Uint8List list = bytes.buffer.asUint8List();
    await controller.addImage(name, list);
  }
}
