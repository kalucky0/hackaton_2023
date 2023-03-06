import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../cubits/route_send_cubit.dart';

class RouteSend extends StatelessWidget {
  const RouteSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: BlocProvider(
        create: (context) => RouteSendStateCubit(),
        child: BlocConsumer<RouteSendStateCubit, RouteSendState>(
          listener: (context, state) {
            if (state is RouteSendExit) Navigator.pop(context);
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  'assets/blue-checkmark.json',
                  repeat: false,
                  height: 300,
                  animate: state.animate,
                ),
                Text(
                  'Wysłano do akceptacji',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
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
