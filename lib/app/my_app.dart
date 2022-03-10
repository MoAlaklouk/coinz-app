import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../constant/color_manger.dart';
import '../constant/string_manager.dart';
import '../constant/theme_manager.dart';
import 'app_router/app_router.dart';
import 'app_router/binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorManager.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () {
        return GetMaterialApp(
          locale: const Locale(AppString.lang),
          debugShowCheckedModeBanner: false,
          initialBinding: Binding(),
          getPages: appRoutes,
          theme: getApplicationTheme(),
          builder: (context, child) {
            return FlutterSmartDialog(child: child);
          },
        );
      },
    );
  }
}
