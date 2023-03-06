part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState(this.selectedChip, this.selectedRoute);

  final int selectedChip;
  final int selectedRoute;
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0, 0);
}

class HomeUpdate extends HomeState {
  const HomeUpdate(super.selectedChip, super.selectedRoute);
}
