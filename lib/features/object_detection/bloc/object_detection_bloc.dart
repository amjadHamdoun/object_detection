import 'dart:developer';
import 'dart:ui';

import 'package:akw/core/constant/app_constants.dart';
import 'package:akw/core/constant/key_constants.dart';
import 'package:akw/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'object_detection_state.dart';

part 'object_detection_event.dart';

class ObjectDetectionBloc extends Bloc<ObjectDetectionEvent, ObjectDetectionState> {

  ObjectDetectionBloc()
      : super(ObjectDetectionState.initial()) {

    on<GetScaleEvent>((event, emit) async {
      double scale = event.size.aspectRatio * event.cameraAspectRatio;
      if (scale < 1)
        {
          scale = 1 / scale;
        }
      emit(state.rebuild((b) => b..scale = scale));
    });

    on<ShowErrorEvent>((event, emit) async {

      emit(state.rebuild((b) => b..error = event.error));

      await Future.delayed(const Duration(seconds: 5)).then((value) {
        emit(state.rebuild((b) => b..error = ''));
      },);

    });

    on<ChangeGuidanceMessageEvent>((event, emit) async {
      emit(state.rebuild((b) => b..guidanceMessage = event.guidanceMessage
      ));
    });

    on<ConfirmObjectDetectionEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b..guidanceMessage = event.guidanceMessage
          ..captureDate = event.captureDate
        ..detectedConfidence = event.detectedConfidence
        ..detectedObjectType = event.detectedObjectType
        ..objectDetectionDone = true
      ));
    });


  }
}
