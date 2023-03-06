part of 'scanned_cubit.dart';

abstract class ScannedState {
  const ScannedState(this.counter);

  final int counter;
}

class ScannedInitial extends ScannedState {
  const ScannedInitial(int counter) : super(counter);
}
