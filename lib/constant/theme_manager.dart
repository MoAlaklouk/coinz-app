import 'package:flutter/services.dart';

import 'color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts_manager.dart';
import 'style_manager.dart';
import 'value_manager.dart';

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
      elevation: AppSize.s4,
    ),
//Appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      iconTheme: IconThemeData(color: ColorManager.black),
      elevation: AppSize.s8,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
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
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    textTheme: TextTheme(
      headline1:
          getBoldStyle(color: ColorManager.white, fontSize: AppSize.s12.sp),
      headline2:
          getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s10.sp),
      headline3: getBoldStyle(
        color: ColorManager.white,
        fontSize: AppSize.s12.sp,
      ),
      headline4:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s18.sp),
      headline5:
          getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s20.sp),
      headline6:
          getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s20.sp),
      subtitle1:
          getMediumStyle(color: ColorManager.white, fontSize: AppSize.s14.sp),
      subtitle2:
          getMediumStyle(color: ColorManager.white, fontSize: AppSize.s14.sp),
      caption: getLightStyle(color: ColorManager.white),
      bodyText1: getLightStyle(color: ColorManager.white),
    ),

    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p1_5),
        hintStyle: getRegularStyle(color: ColorManager.grey1, fontSize: 12.sp),
        labelStyle:
            getMediumStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
        ),
        suffixIconColor: ColorManager.primary),

    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: ColorManager.primary),

    iconTheme: IconThemeData(color: ColorManager.primary),
  );
}
