import 'package:coinz_app/constant/helper.dart';
import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/data/network/api_key.dart';
import 'package:coinz_app/data/network/remote/api.dart';
import 'package:coinz_app/data/network/remote/loading.dart';
import 'package:coinz_app/data/network/remote/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constant/assets_manager.dart';
import '../../constant/string_manager.dart';
import '../alart_coinz/alart_coinz_screen..dart';
import '../home/home_screen.dart';
import '../news/news_screen.dart';

class LayoutController extends GetxController {
  @override
  void onInit() {
    getCurrencies(page_count: pageCount, page_number: pageNum);

    super.onInit();
  }

  LayoutController._();
  static late final LayoutController _instance = LayoutController._();
  static LayoutController get instance => _instance;
  factory LayoutController() {
    return _instance;
  }

  bool islaod = true;
  int currantPageIndex = 0;
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

  void changeBottomNavigationBar(int index, context) {
    currantPageIndex = index;
    update();
  }

  CurrenciesModel? currenciesModel;
  List currencies = [];

  void getCurrencies({
    required int page_count,
    required int page_number,
  }) {
    islaod = false;
    ApiRequest(
      path: currencies_list,
      method: getMethod,
      queryParameters: {
        'i_page_count': page_count,
        'i_page_number': page_number,
      },
    ).request(
      onSuccess: (data, response) {
        currenciesModel = CurrenciesModel.fromJson(response);
        currencies = currenciesModel!.currencies!;
        islaod = true;
        update();
      },
      onError: (error) {
        print(error.toString());
        islaod = true;
        update();
      },
    );
  }
}
