import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_helper.dart';
import 'style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    //main color of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightGrey,
    primaryColorDark: ColorManager.darkGrey,
    disabledColor: ColorManager
        .grey1, // will be used incase of disabled button for example
    accentColor: ColorManager.grey,
    splashColor: ColorManager.white,

    //card theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: 4,
    ),
//Appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      iconTheme: IconThemeData(color: ColorManager.black),
      elevation: 8,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      hoverColor: ColorManager.grey,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    textTheme: TextTheme(
      headline1:
          getBoldStyle(color: ColorManager.black, fontSize: 12.sp),
      headline2:
          getSemiBoldStyle(color: ColorManager.black, fontSize: 10.sp),
      headline3: getBoldStyle(
        color: ColorManager.black,
        fontSize: 12.sp,
      ),
      headline4:
          getRegularStyle(color: ColorManager.black, fontSize: 18.sp),
      headline5:
          getSemiBoldStyle(color: ColorManager.black, fontSize: 20.sp),
      headline6:
          getSemiBoldStyle(color: ColorManager.black, fontSize: 20.sp),
      subtitle1:
          getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
      subtitle2:
          getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
      caption: getLightStyle(color: ColorManager.black),
      bodyText1: getLightStyle(color: ColorManager.black),
    ),

    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightGreyBorder,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightGreyBorder,
            width:1.55.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: 1.5.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightGreyBorder,
            width: 1.5.w,
          ),
        ),
        suffixIconColor: ColorManager.primary),

    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: ColorManager.primary),

    iconTheme: IconThemeData(color: ColorManager.primary),
  );
}
