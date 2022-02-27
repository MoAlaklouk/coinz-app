import '../../constant/assets_manager.dart';
import '../../constant/string_manager.dart';
import 'splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
                  AssetsManager.splashGrid_2,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  AssetsManager.splashGrid_1,
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
                      AssetsManager.splashGrid_4,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      AssetsManager.splashGrid_3,
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
Widget iconBackGround() => Container(
      child: SvgPicture.asset(AssetsManager.boxSplash),
    );
Widget textSplash(context) => Container(
      child: Text(
        AppString.splashText,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
