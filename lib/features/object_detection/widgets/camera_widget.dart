import 'package:akw/features/object_detection/bloc/object_detection_bloc.dart';
import 'package:akw/features/object_detection/bloc/object_detection_state.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraWidget extends StatelessWidget {
  final ObjectDetectionBloc objectDetectionBloc;
  final CameraController cameraController;
  const CameraWidget({super.key , required this.cameraController,
    required this.objectDetectionBloc
  }) ;

  @override
  Widget build(BuildContext context) {
    objectDetectionBloc.add(GetScaleEvent(
        size: MediaQuery.of(context).size,
        cameraAspectRatio: cameraController.value.aspectRatio
    ));
    return BlocBuilder<ObjectDetectionBloc,ObjectDetectionState>(
      bloc: objectDetectionBloc,
      builder: (context, state) {
        return Transform.scale(
          scale: state.scale,
          child: Center(
            child: CameraPreview(cameraController),
          ),
        );
      },
    );
  }
}
