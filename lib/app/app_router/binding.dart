import 'package:coinz_app/presentation/coinz_item/coinz_item_controller.dart';
import 'package:coinz_app/presentation/home/home_controller.dart';
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
    Get.lazyPut(() => CoinzItemController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);

  }
}
