
import 'package:akw/features/items/widgets/go_to_settings_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../object_detection/object_detection_page.dart';

Future<void> checkPermissions(final BuildContext context,final String objectName , final CameraDescription cameraDescription) async {
  // Check and request camera permissions
  if (await Permission.camera.isGranted && await Permission.microphone.isGranted) {
    if(context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => ObjectDetectionPage(camera: cameraDescription,
        targetObject: objectName,
      ),));
    }
  } else {
    final cameraStatus = await Permission.camera.request();
    final microphoneStatus = await Permission.microphone.request();

    if (cameraStatus.isGranted&&microphoneStatus.isGranted) {
      if(context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => ObjectDetectionPage(camera: cameraDescription,
          targetObject: objectName,
        ),));
      }
    }
    else if (cameraStatus.isPermanentlyDenied || cameraStatus.isDenied) {
      if(context.mounted){
        goToSettingsDialog(context,'Camera');
      }
    }
    else if (microphoneStatus.isPermanentlyDenied || microphoneStatus.isDenied) {
      if(context.mounted){
        goToSettingsDialog(context,'Microphone');
      }
    }

  }
}
