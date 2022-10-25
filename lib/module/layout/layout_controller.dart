import '../../app/my_app_controller.dart';
import '../../utils/utils.dart';
import '../../model/coinz_model.dart';
import '../../api/api_key.dart';
import '../../api/methods.dart';

import '../../api/api.dart';
import '../coinz_item/coinz_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../helper/assets_helper.dart';
import '../../helper/string_manager.dart';
import '../../model/news_model.dart';
import '../alart_coinz/alart_coinz_screen..dart';
import '../home/home_screen.dart';
import '../news/news_screen.dart';

class LayoutController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
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


  
}
