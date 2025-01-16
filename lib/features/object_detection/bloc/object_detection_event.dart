part of 'object_detection_bloc.dart';

abstract class ObjectDetectionEvent extends Equatable {
  const ObjectDetectionEvent();
  @override
  List<Object> get props => [];
}

class GetScaleEvent extends ObjectDetectionEvent {
    final double cameraAspectRatio;
    final Size size;

    const GetScaleEvent({required this.cameraAspectRatio , required this.size});
}

class ShowErrorEvent extends ObjectDetectionEvent {
  final String error;

  const ShowErrorEvent({required this.error});
}

class ConfirmObjectDetectionEvent extends ObjectDetectionEvent {
  final String  guidanceMessage ;
  final String  detectedObjectType;
  final double  detectedConfidence;
  final String  captureDate;
 const ConfirmObjectDetectionEvent({
   required this.captureDate,
   required this.detectedObjectType,
   required this.detectedConfidence,
   required this.guidanceMessage,

 });
}

class ChangeGuidanceMessageEvent extends ObjectDetectionEvent {
  final String  guidanceMessage ;

  const ChangeGuidanceMessageEvent({
    required this.guidanceMessage,
  });
}









