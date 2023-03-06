import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/scanned_cubit.dart';

class ScannedScreen extends StatelessWidget {
  const ScannedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: BlocProvider(
        create: (context) => ScannedCubit(),
        child: BlocBuilder<ScannedCubit, ScannedState>(
          builder: (context, state) {
            final cubit = context.read<ScannedCubit>();
            return Center(
              child: ConfettiWidget(
                confettiController: cubit.controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                // don't specify a direction, blast randomly
                shouldLoop: true,
                // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ],
                // manually specify the colors to be used
                createParticlePath: drawStar, // define a custom shape/path.
              ),
            );
          },
        ),
      ),
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
