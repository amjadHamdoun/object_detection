

import 'package:akw/features/object_detection/bloc/object_detection_bloc.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/image_classification_helper.dart';



int calculateBrightness(CameraImage cameraImage) {
  final plane = cameraImage.planes.first;
  final bytes = plane.bytes;
  final total = bytes.fold<int>(0, (sum, byte) => sum + byte);
  return total ~/ bytes.length;
}