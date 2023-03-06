import 'package:flutter_bloc/flutter_bloc.dart';

part 'scanned_state.dart';

class ScannedCubit extends Cubit<ScannedState> {
  ScannedCubit() : super(const ScannedInitial()) {
    Future<void>.delayed(const Duration(seconds: 3), () {
      emit(const ScannedExit());
    });
  }
}
