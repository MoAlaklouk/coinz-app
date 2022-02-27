import '../../constant/assets_manager.dart';
import '../../constant/color_manger.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/helper.dart';
import '../../constant/string_manager.dart';
import '../../constant/style_manager.dart';
import '../../constant/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          homeTitel(),
          lastUpdateText(),
          favoriteCoinz(),
        ],
      ),
    );
    
  }

  Widget homeTitel() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: AppMargin.m4, right: AppMargin.m4),
        child: Text(
          AppString.homeScreenTitel,
          style: getRegularStyle(color: ColorManager.black, fontSize: 20.sp),
        ),
      );
  Widget lastUpdateText() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m2),
        child: Row(
          children: [
            Text(
              AppString.lastUpData,
              style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
            ),
            Text(
              dateFormat(DateTime.now()),
              style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
            ),
          ],
        ),
      );
  Widget favoriteCoinz() => Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            4,
            (index) => favoriteCoinzItem(),
          ),
        ),
      );
  Widget favoriteCoinzItem() => Card(
        child: Stack(
          children: [
            Container(
              child: SvgPicture.asset(
                AssetsManager.splashGrid_1,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: AppHeightSize.sh5,
                    width: AppHeightSize.sh5,
                    child: SvgPicture.asset(
                      AssetsManager.homeCoinzIcon,
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppHeightSize.sh1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.textfavoriteCoinz,
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      width: AppWidthSize.sw1,
                    ),
                    Text(
                      AppString.textfavoriteCoinzEn,
                      style: getMediumStyle(color: ColorManager.white),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
}
