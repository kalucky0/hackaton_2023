import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/camera_cubit.dart';
import 'scanned.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  static const scannerSize = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, _, __) => const ScannedScreen(),
              opaque: false,
            ),
          );
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: BlocProvider(
                create: (context) => CameraCubit(),
                child: BlocConsumer<CameraCubit, CameraState>(
                  listener: (context, state) {
                    if (state is CameraExit) {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, _, __) => const ScannedScreen(),
                          opaque: false,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<CameraCubit>();
                    if (state is CameraInitial ||
                        !cubit.controller.value.isInitialized) {
                      return Container(color: Colors.black);
                    } else {
                      final mediaSize = MediaQuery.of(context).size;
                      final scale = 1 /
                          (cubit.controller.value.aspectRatio *
                              mediaSize.aspectRatio);
                      return ClipRect(
                        clipper: _MediaSizeClipper(mediaSize),
                        child: Transform.scale(
                          scale: scale,
                          alignment: Alignment.topCenter,
                          child: CameraPreview(cubit.controller),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                height: MediaQuery.of(context).size.height * .5 - scannerSize,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                height: MediaQuery.of(context).size.height * .5 - scannerSize,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * .5 - scannerSize,
              left: 0,
              child: Container(
                color: Colors.black54,
                width: MediaQuery.of(context).size.width * .5 - scannerSize,
                height: scannerSize * 2,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * .5 - scannerSize,
              right: 0,
              child: Container(
                color: Colors.black54,
                width: MediaQuery.of(context).size.width * .5 - scannerSize,
                height: scannerSize * 2,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * .5 - scannerSize - 3,
              left: MediaQuery.of(context).size.width * .5 - scannerSize - 3,
              child: Container(
                width: scannerSize * 2.0 + 5,
                height: scannerSize * 2.0 + 5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;

  const _MediaSizeClipper(this.mediaSize);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
