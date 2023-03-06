part of 'route_creation_cubit.dart';

@immutable
abstract class RouteCreationState {
  const RouteCreationState(this.tab);

  final int tab;
}

class RouteCreationStateInitial extends RouteCreationState {
  const RouteCreationStateInitial() : super(1);
}

class ProfileTabChanged extends RouteCreationState {
  const ProfileTabChanged(int tab) : super(tab);
}