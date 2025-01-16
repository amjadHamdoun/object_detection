

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors/my_colors.dart';

class ErrorTextWidget extends StatelessWidget {

  final String error;
  final Color? color;
  final String? buttonName;
  final VoidCallback? callback;
  const ErrorTextWidget({super.key,
      required this.error,
     required this.callback,
     this.buttonName,
    this.color =MyColors.colorBlack,
});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            child: Text(
              error,

              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if(callback!=null)
          MaterialButton(
            color: MyColors.colorPrimary,
            onPressed: callback,
           child: Text(buttonName??'Refresh',style: TextStyle(
             color: MyColors.white,
             fontSize:14.sp,

           )),
          ),
        ],
      ),
    );;
  }
}
