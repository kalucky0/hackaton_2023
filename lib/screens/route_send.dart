import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackaton/cubits/route_send_cubit.dart';
import 'package:hackaton/screens/place.dart';
import 'package:lottie/lottie.dart';

import '../cubits/scanned_cubit.dart';

class RouteSend extends StatelessWidget {
  const RouteSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: BlocProvider(
        create: (context) => RouteSendStateCubit(),
        child: BlocListener<RouteSendStateCubit, RouteSendState>(
          listener: (context, state) {
              Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Lottie.asset(
                'assets/checkmark.json',
                repeat: false,
                height: 300,
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
          ),
        ),
      ),
    );
  }
}
