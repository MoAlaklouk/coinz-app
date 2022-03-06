import '../../presentation/news_details/news_details_screen.dart';
import '../../constant/value_manager.dart';
import '../../presentation/layout/layout_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String splashRoute = '/';
  static const String layoutRoute = '/layout';
  static const String newsDetails = '/newsDetails';
}

List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: Routes.splashRoute,
    page: () => const SplashScreen(),
    transition: Transition.fade,
    transitionDuration: Duration(seconds: AppDuration.d1),
  ),
  GetPage(
    name: Routes.layoutRoute,
    page: () => const LayoutScreen(),
    transition: Transition.fade,
    transitionDuration: Duration(seconds: AppDuration.d1),
  ),
  GetPage(
    name: Routes.newsDetails,
    page: () => const NewsDetailsScreen(),
    transition: Transition.fade,
    transitionDuration: Duration(seconds: AppDuration.d1),
  ),
];
