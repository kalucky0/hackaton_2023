part of 'route_send_cubit.dart';

abstract class RouteSendState {
  const RouteSendState(this.animate);

  final bool animate;
}

class RouteSendStateInitial extends RouteSendState {
  const RouteSendStateInitial() : super(false);
}

class RouteStart extends RouteSendState {
  const RouteStart() : super(true);
}

class RouteSendExit extends RouteSendState {
  const RouteSendExit() : super(true);
}
