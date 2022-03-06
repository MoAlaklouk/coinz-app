import 'dart:async';

import 'package:coinz_app/constant/value_manager.dart';
import '../../app/app_router/app_router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await startDelay();
    super.onInit();
  }

  Timer? _timer;
  startDelay() {
    _timer = Timer(Duration(seconds: AppDuration.d1), _goNext);
  }

  _goNext() {
    Get.offAllNamed(
      Routes.layoutRoute,
    );
  }
}
