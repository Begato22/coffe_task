import 'package:decoffee/core/utils/app_assets.dart';
import 'package:decoffee/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromARGB(255, 252, 252, 252),
      textTheme: textTheme,
      fontFamily: AppAssets.appFontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 22.sp,
        ),
      ),
      elevatedButtonTheme: elevatedButtonThemeData());
}

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.primarySwatch,
      colorScheme: AppColors.colorSchemeLight,
      scaffoldBackgroundColor: AppColors.colorSchemeLight.background,
      fontFamily: AppAssets.appFontFamily,
      textTheme: textTheme,
      buttonTheme: buttonThemeData(),
      textButtonTheme: textButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      outlinedButtonTheme: outlinedButtonThemeData(),
      inputDecorationTheme: inputDecorationTheme(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent),
      iconTheme:
          IconThemeData(color: AppColors.colorSchemeLight.secondaryContainer),
      floatingActionButtonTheme: floatingActionButtonThemeData());

  static ThemeData darkTheme = ThemeData(
      primarySwatch: AppColors.primarySwatch,
      colorScheme: AppColors.colorSchemeDark,
      fontFamily: AppAssets.appFontFamily,
      // useMaterial3: true,
      textTheme: textTheme,
      buttonTheme: buttonThemeData(),
      textButtonTheme: textButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      outlinedButtonTheme: outlinedButtonThemeData(),
      inputDecorationTheme: inputDecorationTheme(),
      iconTheme:
          IconThemeData(color: AppColors.colorSchemeLight.secondaryContainer),
      floatingActionButtonTheme: floatingActionButtonThemeData());

  // static BoxDecoration boxDecoration({radius = 10.0, color}) => BoxDecoration(
  //       color: color ?? Get.theme.cardColor,
  //       borderRadius: BorderRadius.circular(double.parse(radius.toString())),
  //       boxShadow: [
  //         BoxShadow(
  //             color: Theme.of(Get.context!)
  //                 .colorScheme
  //                 .onSecondary
  //                 .withOpacity(.1),
  //             blurRadius: 8),
  //       ],
  //     );

  // static List<BoxShadow> get boxShadow => [
  //       BoxShadow(
  //           color:
  //               Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.1),
  //           blurRadius: 8),
  //     ];
}

TextButtonThemeData textButtonThemeData() {
  return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

OutlinedButtonThemeData outlinedButtonThemeData() {
  return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    side: const BorderSide(color: AppColors.primarySwatch),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}

ButtonThemeData buttonThemeData() {
  return ButtonThemeData(
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}

InputDecorationTheme inputDecorationTheme({double radius = 8}) {
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding:
        EdgeInsets.symmetric(vertical: radius, horizontal: radius + 2),
    prefixIconColor: AppColors.secondaryContainerLight,
    suffixIconColor: AppColors.secondaryContainerLight,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: AppColors.primarySwatch),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primarySwatch),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.secondaryContainerLight),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primarySwatch),
      borderRadius: BorderRadius.circular(radius),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(),
    ),
  );
}

TextTheme textTheme = TextTheme(
  headline1: TextStyle(
      fontSize: 16.sp,
      color: AppColors.secondryColor,
      fontWeight: FontWeight.bold),
  headline2: TextStyle(
      fontSize: 14.sp,
      color: AppColors.secondryColor,
      fontWeight: FontWeight.bold),
  headline3: TextStyle(
      fontSize: 12.sp,
      color: AppColors.secondryColor,
      fontWeight: FontWeight.bold),
  headline4: const TextStyle(),
  headline5: const TextStyle(),
  headline6:
      TextStyle(height: 1.5, fontWeight: FontWeight.bold, fontSize: 8.sp),
  subtitle1: TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.secondryColor,
  ),
  subtitle2: TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.secondryColor,
  ),
  bodyText1: const TextStyle(height: 1.5, color: Colors.white),
  bodyText2: TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.secondryColor,
  ),
  button: const TextStyle(
    height: 1.7,
    fontWeight: FontWeight.bold,
  ),
  caption: TextStyle(height: 1.5, color: AppColors.primarySwatch[800]),
  overline: const TextStyle(),
);

FloatingActionButtonThemeData floatingActionButtonThemeData() {
  return const FloatingActionButtonThemeData(
      elevation: 0, foregroundColor: Colors.white);
}
