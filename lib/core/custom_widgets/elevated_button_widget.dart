import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors/my_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  //
  ElevatedButtonWidget(
      {this.onPressed,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.text,
      this.borderColor = Colors.transparent,
      this.textColor,
      this.bgColor,
      this.borderRadius,
      this.image});

  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? enabled;
  final String? text;
  final String? image;
  final Color borderColor;
  final Color? textColor;
  final Color? bgColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      onPressed: onPressed,
      color: bgColor ?? MyColors.primaryTheme.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 25)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h,horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              image != null
                  ? Image.asset(
                      image!,
                      height: 20.r,
                    )
                  : const SizedBox(),
              Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: textColor ?? Colors.grey.shade50,
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
