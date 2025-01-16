



import 'package:built_value/built_value.dart';




part 'object_detection_state.g.dart';


abstract class ObjectDetectionState implements Built<ObjectDetectionState,
    ObjectDetectionStateBuilder> {



  String get error;
  String get message;
  double get scale;

  String get guidanceMessage ;
  String get detectedObjectType;
  double get detectedConfidence;
  String get captureDate;
  bool get objectDetectionDone;



  ObjectDetectionState._();

  factory ObjectDetectionState([void Function(ObjectDetectionStateBuilder) updates]) = _$ObjectDetectionState;

  factory ObjectDetectionState.initial() {
    return ObjectDetectionState((b) => b

        ..error=''
        ..message=''
        ..scale=1
        ..objectDetectionDone=false
        ..captureDate=''
        ..detectedConfidence=0.0
        ..detectedObjectType=''
        ..guidanceMessage = ''
    );
  }
}


