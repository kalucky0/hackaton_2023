import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(const CameraInitial()) {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (state is CameraInitial) {
        emit(const CameraLoaded());
        Future<void>.delayed(const Duration(milliseconds: 1800), () {
          emit(const CameraExit());
        });
      }
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  late final CameraController controller;
}