import '../../app/my_app_controller.dart';
import '../../constant/helper.dart';
import '../../data/model/coinz_model.dart';
import '../../data/network/api_key.dart';
import '../../data/network/remote/api.dart';
import '../../data/network/remote/methods.dart';
import '../coinz_item/coinz_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constant/assets_manager.dart';
import '../../constant/string_manager.dart';
import '../../data/model/news_model.dart';
import '../alart_coinz/alart_coinz_screen..dart';
import '../home/home_screen.dart';
import '../news/news_screen.dart';

class LayoutController extends GetxController {
  @override
  void onInit() async {
    getCurrencies(pageCount: coinzPageCount, pageNumber: coinzPageNum);
    super.onInit();
  }

  LayoutController._();
  static late final LayoutController _instance = LayoutController._();
  static LayoutController get instance => _instance;
  factory LayoutController() {
    return _instance;
  }

  bool islaod = true;
  List<Widget> secreens = [
    HomeScreen(),
    AlartScreen(),
    NewsScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavIcon = [
    BottomNavigationBarItem(
      label: AppString.homeBottmNavTitel,
      icon: SvgPicture.asset(AssetsManager.bottomNavBarHomeNoAc),
      activeIcon: SvgPicture.asset(AssetsManager.bottomNavBarHomeAc),
    ),
    BottomNavigationBarItem(
      label: AppString.alartBottmNavTitel,
      icon: SvgPicture.asset(AssetsManager.bottomNavBarAlartNoAc),
      activeIcon: SvgPicture.asset(AssetsManager.bottomNavBarAlartAc),
    ),
    BottomNavigationBarItem(
      label: AppString.reportBottmNavTitel,
      icon: SvgPicture.asset(AssetsManager.bottomNavBarReportNoAc),
      activeIcon: SvgPicture.asset(AssetsManager.bottomNavBarReportAc),
    ),
  ];
  int currantPageIndex = 0;

  void changeBottomNavigationBar(int index, context) {
    currantPageIndex = index;
    update();
  }

  CurrenciesModel? currenciesModel;
  void getCurrencies({
    required int pageCount,
    required int pageNumber,
  }) {
    islaod = false;

    ApiRequest(
      path: CURRENCIES,
      method: getMethod,
      queryParameters: {
        'i_page_count': pageCount,
        'i_page_number': pageNumber,
      },
    ).request(
      onSuccess: (data, response) {
        coinzPageNum++;

        currenciesModel = CurrenciesModel.fromJson(response);
        currenciesItem!.addAll(List.generate(
          pageCount,
          (index) => currenciesModel!.currencies![index],
        ));
        islaod = true;
        update();
      },
      onError: (error) {
        print(error.toString());
        update();
      },
    );
  }

  
}
  List<Currencies>? currenciesItem = [];
