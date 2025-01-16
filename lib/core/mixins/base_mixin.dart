import 'dart:io';
import 'package:akw/core/constant/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';




mixin BaseMixin {
  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value,
        style: TextStyle(
          fontSize: 14.sp
        ),
        ),
        // duration: Duration(seconds: 2),
      ),
    );
  }

  void showLanguageDialog(BuildContext context) async {
    // show the loading dialog
    Platform.isAndroid
        ? showDialog<void>(
      // The user CANNOT close this dialog  by pressing outsite it
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  "Select Language".tr(),
                  style: TextStyle(
                    fontSize: StyleConstants.fontSize.sp,
                  ),
                )),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    "العربية",
                    style: TextStyle(
                      fontSize: (StyleConstants.fontSize-2).sp,
                    ),
                  ),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'en') {
                      Navigator.of(context).pop();

                      await context.setLocale(const Locale('ar'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
              TextButton(
                  child: Text(
                    "English",
                    style: TextStyle(
                      fontSize: (StyleConstants.fontSize-2).sp,

                  ),
                  ),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'ar') {
                      Navigator.of(context).pop();
                      await context.setLocale(const Locale('en'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  })
            ],
          );
        })
        : showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text("Select Language".tr()),
            actions: [
              CupertinoDialogAction(
                  child: const Text("العربية"),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'en') {
                      Navigator.of(context).pop();

                      await context.setLocale(const Locale('ar'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
              CupertinoDialogAction(
                  child: const Text("English"),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'ar') {
                      Navigator.of(context).pop();
                      await context.setLocale(const Locale('en'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          );
        });
  }


  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String msg,
    String? positiveBtn,
    String? negativeBtn,
    VoidCallback? positivePressed,
    VoidCallback? negativePressed,
    required bool cancelable
  }) async {
    Platform.isAndroid
        ? showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => cancelable,
                child: AlertDialog(
                  title: Center(child: Text(title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700
                  ),
                  )),
                  content: Text(msg,
                    style: TextStyle(
                        fontSize: 14.sp,
                    ),
                  ),
                  actions: negativeBtn != null
                      ? <Widget>[
                          TextButton(
                              onPressed: negativePressed,
                              child: Text(negativeBtn,style: TextStyle(
                                fontSize: 14.sp
                              ),)),
                          TextButton(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "Ok".tr(),
                               style: TextStyle(fontSize: 14.sp,
                                   color: Colors.red
                               ),
                              ))
                        ]
                      : <Widget>[
                          TextButton(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "Ok".tr()
                                ,
                              style: TextStyle(fontSize: 14.sp,
                                  color: Colors.red
                              ),
                              ))
                        ],
                ),
              );
            },
          )
        : showCupertinoDialog(
            context: context,
            builder: (_) {
              return WillPopScope(
                onWillPop: () async => cancelable,
                child: CupertinoAlertDialog(
                  title: Text(title),
                  content: Text(msg),
                  actions: negativeBtn != null
                      ? <Widget>[
                          CupertinoDialogAction(
                              onPressed: negativePressed,
                              child: Text(negativeBtn,
                               style: TextStyle(
                                   fontSize: 14.sp
                               ),
                              )),
                          CupertinoDialogAction(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "Ok".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp
                                ),
                              ))
                        ]
                      : <Widget>[
                          CupertinoDialogAction(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "Ok".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp
                                ),
                              ))
                        ],
                ),
              );
            });
  }



  Future<void> changeLanguage(BuildContext context) async {
    if (Localizations.localeOf(context).languageCode == 'en') {
      await context.setLocale(const Locale('ar'));
    } else {
      await context.setLocale(const Locale('en'));
    }
  }

  bool isArabic(BuildContext context) {
    return (Localizations.localeOf(context).languageCode == 'ar');
  }

  String getFormattedDate(String date, {String? inputFormat, outputFormat}) {
    if (date == "") {
      return "";
    }
    outputFormat ??= 'MMM-dd, yyyy';
    inputFormat ??= "yyyy-MM-dd HH:mm:ss.S";
    DateTime tempDate = DateFormat(inputFormat,'en').parse(date);
    String formattedDate = DateFormat(outputFormat,'en').format(tempDate);

    return formattedDate;
  }

  DateTime getDate(String date, {String? inputFormat, outputFormat}) {

    inputFormat ??= "yyyy-MM-dd";
    DateTime tempDate = DateFormat(inputFormat,'en').parse(date);
    return tempDate;
  }


  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }

}
