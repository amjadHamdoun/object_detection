import 'package:akw/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors/my_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  //
  const TextFormFieldWidget(
      {super.key,
      this.controller,
      this.hintText,
      this.hintColor,
      this.helpText,
      this.prefixIcon,
      this.suffix,
      this.isPassword,
      this.enabled,
      this.readOnly,
      this.borderColor,
      this.textColor,
      this.isDense,
      this.labelText,
      this.labelColor,
      this.focusBorderColor,
      this.toggleObscured,
      this.textInputType,
      this.regExp,
      this.maxLength,
      this.pad,
        this.onChanged
      });

  final TextEditingController? controller;
  final String? hintText, helpText, labelText;
  final IconData? prefixIcon;
  final bool? suffix;
  final bool? isPassword, enabled, readOnly, isDense;
  final Color? borderColor, focusBorderColor;
  final Color? textColor, hintColor, labelColor;
  final VoidCallback? toggleObscured;
  final TextInputType? textInputType;
  final RegExp? regExp;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final double? pad;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: pad ?? 20.w),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        maxLength: maxLength,
        inputFormatters: <TextInputFormatter>[
          if (textInputType != null && textInputType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: textInputType ?? TextInputType.text,
        readOnly: readOnly ?? false,
        obscureText: isPassword ?? false,
        style: TextStyle(
            color: textColor ?? Theme.of(context).primaryColorDark,
            fontSize: (StyleConstants.fontSize - 2).sp),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: isDense,
          counterStyle: TextStyle(
              color: hintColor ?? Theme.of(context).hintColor,
              fontSize: (StyleConstants.fontSize - 5).sp),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: focusBorderColor ?? Theme.of(context).primaryColor,
              width: 1.0.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: MyColors.colorGrey,
              width: 1.0.h,
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0.w),
              borderSide: BorderSide(
                width: 1,
                color: borderColor ?? Theme.of(context).primaryColorDark,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).primaryColorDark,
              width: 1.0.h,
            ),
          ),
          hintText: hintText ?? '',
          hintStyle: TextStyle(
              color: hintColor ?? MyColors.colorBlack,
              fontSize: (StyleConstants.fontSize - 2).sp),
          helperText: helpText ?? '',
          prefixIcon: null == prefixIcon ? null : Icon(prefixIcon),
          suffix: null == suffix
              ? null
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: GestureDetector(
                    onTap: toggleObscured,
                    child: Icon(
                      isPassword ?? false
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: (StyleConstants.iconSize).sp,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
          enabled: enabled ?? true,
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelColor ?? Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
