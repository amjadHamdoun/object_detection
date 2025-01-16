import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_colors/my_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme({Color? color}) => ThemeData(
        useMaterial3: true,
        primarySwatch: createMaterialColor(color ?? MyColors.colorPrimary),
        primaryColor: color ?? MyColors.colorPrimary,
        primaryColorDark:MyColors.colorBlack,
       primaryColorLight:MyColors.white,
       cardColor: MyColors.white,
       hintColor: MyColors.colorGrey,



    colorScheme: ColorScheme.fromSeed(
            seedColor: color ?? MyColors.colorPrimary,
            outlineVariant: MyColors.colorGrey),
         unselectedWidgetColor:MyColors.unselectedIcon,
        scaffoldBackgroundColor: MyColors.liteWhite,
        fontFamily: "SFUI",
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: MyColors.white),
        iconTheme: const IconThemeData(color: MyColors.colorIcon),
        dialogBackgroundColor: MyColors.white,
        dividerColor: MyColors.colorGrey,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: MyColors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: color ?? MyColors.colorPrimary),
        appBarTheme: const AppBarTheme(
            backgroundColor: MyColors.colorPrimary,
            foregroundColor: MyColors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light)),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}

/// Returns MaterialColor from Color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
