import 'package:flutter_bloc/flutter_bloc.dart';

part 'scanned_state.dart';

class ScannedCubit extends Cubit<ScannedState> {
  ScannedCubit() : super(const ScannedInitial()) {
    Future<void>.delayed(const Duration(milliseconds: 2700), () {
      emit(const ScannedExit());
    });

    Future<void>.delayed(const Duration(milliseconds: 100), () {
      emit(const ScannedStart());
    });
  }
}
