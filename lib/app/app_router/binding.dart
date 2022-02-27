import 'package:get/get.dart';

import '../../presentation/layout/layout_controller.dart';
import '../../presentation/splash/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LayoutController(), fenix: true);
  }
}
