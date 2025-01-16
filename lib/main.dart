import 'dart:io';
import 'package:akw/preference.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'core/constant/key_constants.dart';
import 'core/theme/app_theme.dart';
import 'features/categories/categories_page.dart';
import 'injection.dart' as di;
import 'package:upgrader/upgrader.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();
  await Preferences.init();
  await dotenv.load(fileName: ".env");

  String userId =
      Preferences.preferences!.getString(KeyConstants.keyUserToken) ?? "";
  bool jailBroken = await JailbreakRootDetection.instance.isJailBroken;


  if(!jailBroken)
    {
      runApp(
        EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
            child: MyApp(
              userId: userId,
            )),
      );
    }

}

class MyApp extends StatelessWidget {
  final String userId;

  const MyApp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: "AKW",
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            home: UpgradeAlert(
              showIgnore: false,
              showLater: false,
              dialogStyle: Platform.isAndroid
                  ? UpgradeDialogStyle.material
                  : UpgradeDialogStyle.cupertino,
              child: const CategoriesPage(),
            ));
      },
    );
  }
}
