import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackaton/screens/place.dart';
import 'package:lottie/lottie.dart';

import '../cubits/scanned_cubit.dart';

class ScannedScreen extends StatelessWidget {
  const ScannedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: BlocProvider(
        create: (context) => ScannedCubit(),
        child: BlocConsumer<ScannedCubit, ScannedState>(
          listener: (context, state) {
            if (state is ScannedExit) {
              Navigator.pop(context);
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return const PlaceScreen();
                },
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  'assets/checkmark.json',
                  repeat: false,
                  height: 300,
                  animate: state.animate,
                ),
                Text(
                  '+10 points',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.black.withOpacity(.68),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
