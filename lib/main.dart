import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app_binding/binding.dart';
import 'app/app_router/app_router.dart';
import 'helper/color_helper.dart';
import 'helper/string_manager.dart';
import 'helper/theme_manager.dart';
import 'utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  firebaseMessaging.getInitialMessage();
  massageToken = await firebaseMessaging.getToken();
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data);
  });

  runApp(const MyApp());
  Get.put(MyAppController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorManager.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
              locale: const Locale(AppString.lang),
              debugShowCheckedModeBanner: false,
              initialBinding: Binding(),
              getPages: appRoutes,
              theme: getApplicationTheme(),
              
            ));
  }
}
