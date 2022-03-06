import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constant/assets_manager.dart';
import '../../constant/string_manager.dart';
import '../alart_coinz/alart_coinz_screen..dart';
import '../home/home_screen.dart';
import '../news/news_screen.dart';

class LayoutController extends GetxController {
  int currantPageIndex = 0;
  List<Widget> secreens = [
    const HomeScreen(),
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
}
