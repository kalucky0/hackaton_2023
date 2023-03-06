import 'package:confetti/confetti.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scanned_state.dart';

class ScannedCubit extends Cubit<ScannedState> {
  ScannedCubit() : super(const ScannedInitial(0)) {
    controllerCenter = ConfettiController(
      duration: const Duration(seconds: 2),
    );
    Future<void>.delayed(const Duration(milliseconds: 200), () {
      controllerCenter.play();
    });
  }

  late final ConfettiController controllerCenter;
}
