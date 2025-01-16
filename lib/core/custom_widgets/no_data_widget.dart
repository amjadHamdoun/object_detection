

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors/my_colors.dart';

class NoDataWidget extends StatelessWidget {
  final String? text;
  final Color? color;

  final VoidCallback callback;
  const NoDataWidget({super.key,
     required this.callback,
      this.text,
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
              text?? 'No Data Found',

              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );;
  }
}
