import 'package:get/get.dart';

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
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: AppHeightSize.sh280,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                homeTitel(),
                SizedBox(
                  height: AppHeightSize.sh5,
                ),
                lastUpdateText(),
                SizedBox(
                  height: AppHeightSize.sh16,
                ),
                Expanded(child: gridFavoriteCoinz()),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: titelBar(),
        ),
        coinzSliverList(),
      ],
    ));
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

  Widget gridFavoriteCoinz() => Container(
        child: GridView.count(
          childAspectRatio: 1.61,
          crossAxisCount: 2,
          crossAxisSpacing: AppSize.s10,
          mainAxisSpacing: AppSize.s9,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p23),
          children: [
            favoriteCoinzItem(),
            favoriteCoinzItem(),
            favoriteCoinzItem(),
            newFavoriteCoinzIteme(() {}),
          ],
        ),
      );

  Widget favoriteCoinzItem() => Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          image: const DecorationImage(
            image: AssetImage(AssetsManager.rectangle),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.homeCoinzIcon,
              fit: BoxFit.contain,
              height: AppHeightSize.sh25,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString.price,
                    style: TextStyle(
                        color: ColorManager.white, fontSize: FontSize.s12.sp)),
                Text(
                  AppString.dollarSign,
                  style: TextStyle(color: ColorManager.white),
                ),
              ],
            ),
          ],
        ),
      );

  Widget newFavoriteCoinzIteme(Function function) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: ColorManager.lightGreyBorder,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          onPressed: () => function(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ColorManager.grey,
                radius: 13.r,
              ),
              SizedBox(
                height: AppHeightSize.sh8,
              ),
              Text(
                AppString.pressToAddNew,
                style: getRegularStyle(color: ColorManager.grey),
              )
            ],
          ),
        ),
      );
  Widget titelBar() => Container(
        height: AppHeightSize.sh41,
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
        color: ColorManager.lightGreyBorder,
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

  Widget coinzSliverList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          ((BuildContext context, int index) => coinzListItem(index)),
          childCount: 18,
        ),
      );

  Widget coinzListItem(index) => Container(
        height: AppHeightSize.sh35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '${index + 1}',
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
                Text(AppString.price,
                    style: TextStyle(
                        color: ColorManager.black, fontSize: FontSize.s15.sp)),
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
        ),
      );
}
