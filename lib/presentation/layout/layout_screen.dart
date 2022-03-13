import 'package:coinz_app/data/network/remote/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layout_controller.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LayoutController>(
        builder: (controller) => MyBuildCondition(
          condition: controller.islaod,
          builder: (context) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: controller.bottomNavIcon,
              onTap: (value) =>
                  controller.changeBottomNavigationBar(value, context),
              currentIndex: controller.currantPageIndex,
            ),
            body: controller.secreens[controller.currantPageIndex],
          ),
        ),
      ),
    );
  }
}
