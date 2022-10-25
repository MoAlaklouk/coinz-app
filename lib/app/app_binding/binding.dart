import '../../module/coinz_item/coinz_item_controller.dart';
import '../../module/home/home_controller.dart';
import 'package:get/get.dart';

import '../../module/alart_coinz/alart_coinz_controller.dart';
import '../../module/layout/layout_controller.dart';
import '../../module/news/news_controller.dart';
import '../../module/splash/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => AlartCoinzController(), fenix: true);
    Get.lazyPut(() => CoinzItemController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);

  }
}
