part of 'scanned_cubit.dart';

abstract class ScannedState {
  const ScannedState(this.animate);

  final bool animate;
}

class ScannedInitial extends ScannedState {
  const ScannedInitial() : super(false);
}

class ScannedStart extends ScannedState {
  const ScannedStart() : super(true);
}

class ScannedExit extends ScannedState {
  const ScannedExit() : super(true);
}
