import '../../constant/assets_manager.dart';
import '../../constant/color_manger.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/helper.dart';
import '../../constant/string_manager.dart';
import '../../constant/style_manager.dart';
import '../../constant/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              homeTitel(),
              lastUpdateText(),
            ],
          ),
          SizedBox(
            height: AppHeightSize.sh10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  favoriteCoinzItem(),
                  favoriteCoinzItem(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  favoriteCoinzItem(),
                  favoriteCoinzItem(),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppHeightSize.sh8,
          ),
          titelBar(),
          SizedBox(
            height: AppHeightSize.sh8,
          ),
          Expanded(child: coinzList(context)),
        ],
      ),
    );
  }

  Widget homeTitel() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: AppMargin.m30, right: AppMargin.m25),
        child: Text(
          AppString.homeScreenTitel,
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s20.sp),
        ),
      );
  Widget lastUpdateText() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
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

  Widget favoriteCoinzItem() => Card(
        elevation: AppSize.s0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8)),
        child: Container(
          height: AppHeightSize.sh96,
          width: AppWidthSize.sw155,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManager.rectangle),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsManager.homeCoinzIcon,
                fit: BoxFit.contain,
                height: AppHeightSize.sh20,
              ),
              SizedBox(
                height: AppHeightSize.sh8,
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
        ),
      );

  Widget titelBar() => Container(
        height: AppHeightSize.sh41,
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
        color: ColorManager.lightGrey.withOpacity(.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  AppString.coinzName,
                  style: TextStyle(color: ColorManager.darkGrey),
                  textAlign: TextAlign.center,
                )),
            Expanded(
                flex: 2,
                child: Text(
                  AppString.priceText,
                  style: TextStyle(color: ColorManager.darkGrey),
                  textAlign: TextAlign.center,
                )),
            Expanded(
                child: Text(
              AppString.conizRate,
              style: TextStyle(color: ColorManager.darkGrey),
              textAlign: TextAlign.end,
            )),
          ],
        ),
      );
  Widget coinzList(context) => Container(
        margin: EdgeInsets.all(AppMargin.m3),
        child: ListView.separated(
          itemBuilder: (context, index) => coinzListItem(index),
          separatorBuilder: (context, index) => SizedBox(
            height: AppHeightSize.sh14,
          ),
          itemCount: 15,
        ),
      );
  Widget coinzListItem(index) => Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$index',
                style: TextStyle(
                    color: ColorManager.lightGrey, fontSize: FontSize.s8.sp),
              ),
              SizedBox(
                width: AppWidthSize.sw4,
              ),
              SvgPicture.asset(
                AssetsManager.homeCoinzIcon,
                color: ColorManager.black,
                height: AppHeightSize.sh20,
              ),
              SizedBox(
                width: AppWidthSize.sw4,
              ),
              Text(
                AppString.textfavoriteCoinz,
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s14.sp),
              ),
              SizedBox(
                width: AppWidthSize.sw4,
              ),
              Text(
                AppString.textfavoriteCoinzEn,
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s12.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(AppString.price),
              Text(
                AppString.dollarSign,
                style: TextStyle(color: ColorManager.lightGrey),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AssetsManager.increaseIcon,
                color: ColorManager.whatsUpGreen,
                height: AppHeightSize.sh10,
              ),
              SizedBox(
                width: AppWidthSize.sw4,
              ),
              Text(
                '8.19',
                style: TextStyle(
                  color: ColorManager.whatsUpGreen,
                ),
              ),
            ],
          ),
        ],
      ));

 
}
