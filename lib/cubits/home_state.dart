part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState(this.counter);

  final int counter;
}

class HomeInitial extends HomeState {
  const HomeInitial(int counter) : super(counter);
}
