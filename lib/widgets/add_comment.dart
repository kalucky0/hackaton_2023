import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddComment extends StatelessWidget {
  const AddComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
        bottom: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Dodaj komentarz',
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(MdiIcons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
