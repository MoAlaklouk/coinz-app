import 'package:coinz_app/constant/helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/my_app.dart';

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
