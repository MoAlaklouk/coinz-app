import 'app_router/app_router.dart';
import '../constant/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app_router/binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        getPages: appRoutes,
     
        theme: getApplicationTheme(),
      ),
    );
  }
}
