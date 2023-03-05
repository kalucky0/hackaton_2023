import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackaton/screens/place.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cubits/home_cubit.dart';
import '../widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: const Color(0xFFdddfc2),
                  ),
                ),
                Positioned(
                  height: 50,
                  bottom: 20,
                  left: 20,
                  child: Button(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const PlaceScreen();
                        },
                      );
                    },
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          MdiIcons.qrcodeScan,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Skanuj',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  height: 45,
                  top: 20,
                  left: 20,
                  child: Button(
                    width: 45,
                    height: 45,
                    child: Icon(
                      MdiIcons.plus,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const Positioned(
                  height: 45,
                  top: 20,
                  right: 20,
                  child: Button(
                    width: 45,
                    height: 45,
                    child: Icon(
                      MdiIcons.accountOutline,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
