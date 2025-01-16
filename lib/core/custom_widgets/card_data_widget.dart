import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors/my_colors.dart';
import '../mixins/base_mixin.dart';

class CardDataWidget extends StatelessWidget with BaseMixin {
  CardDataWidget(
      {super.key,
      this.type,
      this.onPressed,
      this.onCancel,
      required this.typeColor,
      required this.valueColor});

  final String? type;
  final Color typeColor, valueColor;
  final VoidCallback? onPressed, onCancel;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

        return InkWell(
          onTap: onPressed,
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical:isLandscape? 15.h: 10.h, horizontal: 10.r),
              width: double.infinity,
              child: Row(
                children: [
                  if (onCancel != null)
                    InkWell(
                        onTap: onCancel,
                        child: Icon(
                          Icons.cancel,
                          size: 22.sp,
                          color: Colors.red,
                        )),
                  Expanded(
                    child: Text(
                      type ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          color: typeColor,
                          fontWeight: FontWeight.w500,
                          fontSize:isLandscape?10.sp: 14.sp),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 22.r,
                    color: MyColors.colorPrimary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
