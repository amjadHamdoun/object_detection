import 'dart:io';

import 'package:akw/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.imagePath,
    required this.objectType,
    required this.confidence,
    required this.captureDate,
  });

  final String imagePath;
  final String objectType;
  final double confidence;
  final String captureDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text("Preview", style: TextStyle(fontSize:( StyleConstants.fontSize + 2).sp))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(imagePath),height: 300.h,width: 1.sw,),
              SizedBox(height: 20.h),
              Text(
                'Object: $objectType',
                style: TextStyle(fontSize: StyleConstants.fontSize.sp),
              ),
              Text(
                'Confidence: ${confidence.toStringAsFixed(2)}',
                style: TextStyle(fontSize: StyleConstants.fontSize.sp),
              ),
              Text(
                'Captured on: $captureDate',
                style: TextStyle(fontSize: StyleConstants.fontSize.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}