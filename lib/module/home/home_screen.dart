import 'package:cached_network_image/cached_network_image.dart';
import '../../api/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app/app_router/app_router.dart';
import '../../helper/assets_helper.dart';
import '../../helper/color_helper.dart';
import '../../helper/fonts_manager.dart';
import '../../utils/utils.dart';
import '../../helper/string_manager.dart';
import '../../helper/style_manager.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            body: MyBuildCondition(
          condition: controller.islaod && controller.isCurrencieslaod,
          builder: (context) => CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight:
                    controller.favouritesModel!.favourites!.length < 2
                        ? 190.h
                        : 295.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      homeTitel(),
                      SizedBox(
                        height: 5.h,
                      ),
                      lastUpdateText(),
                      SizedBox(
                        height: 16.h,
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
        margin: EdgeInsets.only(top: 30.w, right: 25.w),
        child: Text(
          AppString.homeScreenTitel,
          style: getSemiBoldStyle(color: ColorManager.black, fontSize: 20.sp),
        ),
      );
  Widget lastUpdateText() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
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
        childAspectRatio: 1.61.h,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 9,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 23.w),
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
          borderRadius: BorderRadius.circular(8.w),
          image: DecorationImage(
            image: AssetImage(AssetsManager.rectangleBackground[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.coinzItemRoute);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: controller.getFavouriteImageUrl(index),
                imageBuilder: (context, imageProvider) => Image(
                  height: 25.h,
                  color: ColorManager.white,
                  image: imageProvider,
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                  backgroundColor: ColorManager.lightGreyBorder,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.getNameFavourite(index),
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: 14.sp),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.getValueOfFavourite(index),
                      style: TextStyle(
                          color: ColorManager.white, fontSize: 12.sp)),
                  Text(
                    AppString.dollarSign,
                    style: TextStyle(color: ColorManager.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget newFavoriteCoinzIteme(controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
                height: 8.h,
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
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        height: 35.h,
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
                          color: ColorManager.lightGrey, fontSize: 8.sp),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: controller.getCoinzImageUrl(index),
                      imageBuilder: (context, imageProvider) =>
                          Image(image: imageProvider),
                      errorWidget: (context, url, error) => CircleAvatar(
                        backgroundColor: ColorManager.lightGreyBorder,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      controller.getNameCoinz(index),
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: 14.sp),
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
                          color: ColorManager.black, fontSize: 13.sp)),
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
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 4.w,
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
      height: 41.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
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
