import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
    );
  }
}
