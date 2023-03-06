part of 'camera_cubit.dart';

abstract class CameraState {
  const CameraState();
}

class CameraInitial extends CameraState {
  const CameraInitial() : super();
}

class CameraLoaded extends CameraState {
  const CameraLoaded() : super();
}

class CameraExit extends CameraState {
  const CameraExit() : super();
}
