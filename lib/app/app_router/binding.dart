import 'package:get/get.dart';

import '../../presentation/alart_coinz/alart_coinz_controller.dart';
import '../../presentation/layout/layout_controller.dart';
import '../../presentation/news/news_controller.dart';
import '../../presentation/splash/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => AlartCoinzController(), fenix: true);
  }
}
