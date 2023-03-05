import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: const [0.5, 1.0],
      minChildSize: 0.4,
      builder: (BuildContext context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Stack(
                children: [
                  Image.network('https://picsum.photos/1280/720'),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    child: Text(
                      "hdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdhdh",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 100,
                        height: 5,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
