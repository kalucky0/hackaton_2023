part of 'route_creation_cubit.dart';

@immutable
abstract class RouteCreationState {
  const RouteCreationState(this.tab, this.image, this.placesImages);

  final int tab;
  final XFile? image;
  final Map<int, XFile?> placesImages;
}

class RouteCreationImageLoaded extends RouteCreationState {
  const RouteCreationImageLoaded(super.tab, super.image, super.placesImages);
}

class RouteCreationStateInitial extends RouteCreationState {
  const RouteCreationStateInitial() : super(0, null, const {});
}

class ProfileTabChanged extends RouteCreationState {
  const ProfileTabChanged(super.tab, super.image, super.placesImages);
}
