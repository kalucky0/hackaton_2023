import 'package:flutter/material.dart';
import 'package:hackaton/widgets/addComment.dart';
import 'package:hackaton/widgets/comment.dart';

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
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10
                      ),
                      child: Text(
                        "Sample text",
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
                  ),
                  Positioned(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 12,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 100,
                          height: 5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eros ipsum, sollicitudin vitae felis eget, fringilla ornare libero. Sed laoreet ut ligula nec fermentum. Quisque egestas, risus vitae iaculis ultricies, nibh tortor auctor lectus, non congue lorem orci ac nulla. Maecenas mollis faucibus est, tincidunt vehicula massa tincidunt a. Cras eu ipsum ac elit pulvinar sagittis non nec nisl. Etiam augue tortor, imperdiet et scelerisque id, sagittis et ipsum. Vestibulum non venenatis enim, quis fermentum lacus. Vivamus accumsan justo a tincidunt consectetur. Nulla velit libero, faucibus nec sagittis sed, interdum sit amet lacus. Curabitur faucibus iaculis posuere. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lacinia malesuada rutrum.",
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              AddComment(),
              UserComment(),
              UserComment(),

            ],
          ),
        );
      },
    );
  }
}
