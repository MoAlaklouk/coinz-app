import 'package:coinz_app/constant/color_manger.dart';
import 'package:flutter/services.dart';

import 'app_router/app_router.dart';
import '../constant/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_router/binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,));
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () => GetMaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        getPages: appRoutes,
        theme: getApplicationTheme(),
      ),
    );
  }
}
