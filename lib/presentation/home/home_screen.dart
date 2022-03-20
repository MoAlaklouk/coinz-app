import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinz_app/app/app_router/app_router.dart';
import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/data/network/remote/loading.dart';
import 'package:coinz_app/presentation/home/home_controller.dart';
import 'package:coinz_app/presentation/layout/layout_controller.dart';
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
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            body: MyBuildCondition(
          condition: controller.islaod,
          builder: (context) => CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight:
                    controller.favouritesModel!.favourites!.length < 2
                        ? AppHeightSize.sh180
                        : AppHeightSize.sh280,
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
                      Expanded(child: gridFavoriteCoinz(controller)),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: titelBar(),
              ),
              coinzSliverList(controller),
            ],
          ),
        ));
      },
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
  Widget gridFavoriteCoinz(HomeController controller) {
    List<Widget> favorite = [];

    return GridView.count(
        childAspectRatio: 1.61,
        crossAxisCount: 2,
        crossAxisSpacing: AppSize.s10,
        mainAxisSpacing: AppSize.s9,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p23),
        children: List.generate(
          controller.favouritesModel!.favourites!.length + 1,
          (index) {
            if (controller.favouritesModel!.favourites!.length == index &&
                4 > index) {
              favorite.add(newFavoriteCoinzIteme(controller));
            } else {
              if (4 > index) {
                favorite.add(favoriteCoinzItem(controller, index));
              } else {
                return Container();
              }
            }
            return favorite[index];
          },
        ));
  }

  Widget favoriteCoinzItem(HomeController controller, index) => Container(
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
            CachedNetworkImage(
              imageUrl: controller.getImageUrl(index),
              imageBuilder: (context, imageProvider) => Container(
                  height: AppHeightSize.sh25,
                  child: Image(image: imageProvider)),
              errorWidget: (context, url, error) => CircleAvatar(
                backgroundColor: ColorManager.lightGreyBorder,
              ),
            ),
            SizedBox(
              height: AppHeightSize.sh8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.getNameCoinz(index),
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: FontSize.s14.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.getValueOfCoinz(index),
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

  Widget newFavoriteCoinzIteme(controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: ColorManager.lightGreyBorder,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          onPressed: () {
            print(controller.favouritesModel!.favourites!.length);
            Get.toNamed(Routes.coinzItemRoute);
          },
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

  Widget coinzSliverList(HomeController controller) => SliverList(
        delegate: SliverChildBuilderDelegate(
          ((BuildContext context, int index) =>
              coinzListItem(index, controller)),
          childCount: 17,
        ),
      );

  Widget coinzListItem(index, HomeController controller) => Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m4),
        height: AppHeightSize.sh35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          color: ColorManager.lightGrey,
                          fontSize: FontSize.s8.sp),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: controller.getImageUrl(index),
                      imageBuilder: (context, imageProvider) =>
                          Image(image: imageProvider),
                      errorWidget: (context, url, error) => CircleAvatar(
                        backgroundColor: ColorManager.lightGreyBorder,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppWidthSize.sw14,
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      controller.getNameCoinz(index),
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.getValueOfCoinz(index),
                      style: TextStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s13.sp)),
                  Text(
                    AppString.dollarSign,
                    style: TextStyle(color: ColorManager.lightGrey),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    controller.getTradingOfCoinz(index),
                    style: TextStyle(
                      color: ColorManager.whatsUpGreen,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

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
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
