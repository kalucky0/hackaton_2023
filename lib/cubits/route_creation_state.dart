part of 'route_creation_cubit.dart';

@immutable
abstract class RouteCreationState {
  const RouteCreationState(this.tab, this.file);

  final XFile? file;
  final int tab;
}

class RouteCreationImageLoaded extends RouteCreationState {
  const RouteCreationImageLoaded(XFile? file) : super(0, file);
}

class RouteCreationStateInitial extends RouteCreationState {
  const RouteCreationStateInitial() : super(0, null);
}

class ProfileTabChanged extends RouteCreationState {
  const ProfileTabChanged(super.tab, super.file);
}
