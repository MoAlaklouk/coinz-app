import '../../constant/assets_manager.dart';
import '../../constant/string_manager.dart';
import 'layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LayoutController>(
        builder: (controller) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: controller.bottomNavIcon,
            onTap: (value) =>
                controller.changeBottomNavigationBar(value, context),
            currentIndex: controller.currantPageIndex,
          ),
          body: controller.secreens[controller.currantPageIndex],
        ),
      ),
    );
  }
}
