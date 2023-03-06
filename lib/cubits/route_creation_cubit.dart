import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'route_creation_state.dart';

class RouteCreationCubit extends Cubit<RouteCreationState> {
  RouteCreationCubit() : super(const RouteCreationStateInitial());

  // void setTab(int tab) => emit(ProfileTabChanged(tab));
}
