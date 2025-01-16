
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void goToSettingsDialog(BuildContext context,String permissionName ) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:  Text("$permissionName Permission Required"),
      content:  Text(
        "$permissionName permission is required to use this feature. Please enable it in settings.",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            openAppSettings();
          },
          child: const Text("Go to Settings"),
        ),
      ],
    ),
  );
}
