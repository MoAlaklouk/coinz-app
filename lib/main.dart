import 'package:coinz_app/app/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/my_app.dart';

void main() {
  
  runApp(const MyApp());
  Get.put(MyAppController());
}
