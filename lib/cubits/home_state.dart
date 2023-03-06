part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState(this.selectedChip);

  final int selectedChip;
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0);
}

class HomeUpdate extends HomeState {
  const HomeUpdate(super.selectedChip);
}
