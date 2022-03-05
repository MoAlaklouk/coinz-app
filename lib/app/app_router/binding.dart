import 'package:coinz_app/presentation/alart_coinz/alart_coinz_controller.dart';
import 'package:coinz_app/presentation/news/news_controller.dart';
import 'package:coinz_app/presentation/news_details/news_details_screen.dart';
import 'package:get/get.dart';

import '../../presentation/layout/layout_controller.dart';
import '../../presentation/splash/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => NewsDetailsScreen(), fenix: true);
    Get.lazyPut(() => AlartCoinzController(), fenix: true);

  }
}
