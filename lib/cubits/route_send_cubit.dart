import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_send_state.dart';

class RouteSendStateCubit extends Cubit<RouteSendState> {
  RouteSendStateCubit() : super(const RouteSendStateInitial()) {
    Future<void>.delayed(const Duration(milliseconds: 2500), () {
      emit(const RouteSendStateExit());
    });
  }
}
