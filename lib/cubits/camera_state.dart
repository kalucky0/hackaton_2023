part of 'camera_cubit.dart';

abstract class CameraState {
  const CameraState(this.counter);

  final int counter;
}

class CameraInitial extends CameraState {
  const CameraInitial(int counter) : super(counter);
}

class CameraLoaded extends CameraState {
  const CameraLoaded(int counter) : super(counter);
}