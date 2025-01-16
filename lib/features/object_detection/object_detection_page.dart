import 'dart:io';
import 'package:akw/core/constant/app_constants.dart';
import 'package:akw/core/utils/extensions.dart';
import 'package:akw/features/object_detection/widgets/camera_widget.dart';
import 'package:akw/features/result/result_page.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/image_classification_helper.dart';
import '../../injection.dart';
import 'bloc/object_detection_bloc.dart';
import 'bloc/object_detection_state.dart';
import 'methods/calculate_brightness.dart';

class ObjectDetectionPage extends StatefulWidget {
  const ObjectDetectionPage({
    super.key,
    required this.camera,
    required this.targetObject,
  });

  final CameraDescription camera;
  final String targetObject;

  @override
  State<StatefulWidget> createState() => ObjectDetectionPageState();
}

class ObjectDetectionPageState extends State<ObjectDetectionPage> with WidgetsBindingObserver {
  ObjectDetectionBloc bloc =sl<ObjectDetectionBloc>();
  late CameraController cameraController;
  late ImageClassificationHelper imageClassificationHelper;

  bool isProcessing = false;
  bool hasCaptured = false;


  @override
  void initState() {
    bloc.add(ChangeGuidanceMessageEvent(guidanceMessage: "Move closer to the ${widget.targetObject.toPascalCase.removeUnderscores}"));
    init();
    super.initState();
  }

  void init(){
    WidgetsBinding.instance.addObserver(this);
    imageClassificationHelper = ImageClassificationHelper();
    imageClassificationHelper.initHelper();
    cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      imageFormatGroup:
      Platform.isIOS ? ImageFormatGroup.bgra8888 : ImageFormatGroup.yuv420,
    );
    cameraController.initialize().then((value) {
      cameraController.startImageStream(imageAnalysis);
    });

  }

  Future<void> imageAnalysis(
      CameraImage cameraImage
       ) async {
    if (isProcessing || hasCaptured) return;

    isProcessing = true;
    Map<String, double> classification =
    await imageClassificationHelper.inferenceCameraFrame(cameraImage);

    // Lighting condition check
    final brightness = calculateBrightness(cameraImage);
    if (brightness < 50) {
      bloc.add(const ShowErrorEvent(error: "Lighting too poor. Please improve lighting conditions."));
      isProcessing = false;
      return;
    }

    final detectedObject = classification.entries.firstWhere(
          (entry) => entry.key == widget.targetObject,
      orElse: () => const MapEntry("", 0.0),
    );

    if (detectedObject.key.isNotEmpty) {
      final confidence = detectedObject.value;

      if (confidence > 0.7) {
        // Capture metadata
        bloc.add(ConfirmObjectDetectionEvent(
            captureDate: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
            detectedObjectType: detectedObject.key,
            detectedConfidence: confidence,
            guidanceMessage: "Object in position"));
      } else {
        bloc.add(ChangeGuidanceMessageEvent(guidanceMessage: "Move closer to the ${widget.targetObject.toPascalCase.removeUnderscores}"));
      }
    } else {
      bloc.add(const ChangeGuidanceMessageEvent(guidanceMessage: "No object detected. Ensure the object is visible."));
    }



    isProcessing = false;

  }


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<ObjectDetectionBloc,ObjectDetectionState>(
      bloc: bloc,
      listener: (context, state) async {
        if(state.objectDetectionDone&&!hasCaptured){
          await cameraController.takePicture().then((capturedImage) {
            if (context.mounted) {
              // Navigate to the preview screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    imagePath: capturedImage.path,
                    objectType:state.detectedObjectType,
                    confidence: state.detectedConfidence,
                    captureDate: state.captureDate,
                  ),
                ),
              );
            }
          },);
          hasCaptured = true;
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title:  Text("Object Detection ${widget.targetObject.toPascalCase.removeUnderscores}", style: TextStyle(fontSize:( StyleConstants.fontSize - 2).sp))),

            body: Stack(
              children: [
                (!cameraController.value.isInitialized)
                    ? const SizedBox()
                    : CameraWidget(cameraController: cameraController,
                  objectDetectionBloc:bloc,
                ),
                // User guidance message
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    color:  Colors.black.withOpacity(0.5),
                    child: Text(
                      state.guidanceMessage,
                      style: TextStyle(color: Colors.white, fontSize: StyleConstants.fontSize.sp),
                    ),
                  ),
                ),
                // Error message
                if (state.error.isNotEmpty)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.all(16.r),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        state.error,
                        style: TextStyle(color: Colors.white, fontSize: StyleConstants.fontSize.sp),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },

    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        cameraController.stopImageStream();
        break;
      case AppLifecycleState.resumed:
        if (!cameraController.value.isStreamingImages) {
          await cameraController.startImageStream(imageAnalysis);
        }
        break;
      default:
    }
  }




  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController.dispose();
    imageClassificationHelper.close();
    super.dispose();
  }
}


