import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constant/assets_manager.dart';
import '../../constant/color_manger.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/string_manager.dart';
import '../../constant/style_manager.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) => Scaffold(
          body: Stack(
            children: [
              backGround(),
              Align(
                alignment: Alignment.center,
                child: textSplash(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget backGround() => Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(
                  AssetsManager.splashGrid_1,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  AssetsManager.splashGrid_2,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: SvgPicture.asset(
                      AssetsManager.splashGrid_3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      AssetsManager.splashGrid_4,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: iconBackGround(),
              )
            ],
          ),
        ),
      ],
    );
Widget iconBackGround() => SvgPicture.asset(AssetsManager.boxSplash);
Widget textSplash(context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          
          AppString.blocText,
          style: getSemiBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s25.sp,),
        ),
        Text(
          AppString.chainText,
          style: getSemiBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s25.sp),
        ),
      ],
    );
