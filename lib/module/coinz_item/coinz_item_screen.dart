import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinz_app/api/loading.dart';
import '../home/home_controller.dart';
import '../../helper/assets_helper.dart';
import '../../helper/color_helper.dart';
import '../../helper/fonts_manager.dart';
import '../../helper/string_manager.dart';
import '../../helper/style_manager.dart';
import 'coinz_item_controller.dart';
import '../home/home_screen.dart';
import '../layout/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class CoinzItemScreen extends StatelessWidget {
  const CoinzItemScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: GetBuilder<CoinzItemController>(
          builder: (controller) => controller.listOfCoinz.isEmpty
              ? startLoading()
              : Column(
                  children: [
                    titelBar(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(child: lodeMore(controller)),
                  ],
                ),
        ));
  }

  Widget listOfCoinzItem(CoinzItemController controller) => ListView.separated(
      controller: controller.scrollController,
      itemBuilder: (context, index) => coinzListItem(index, controller),
      separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
      itemCount: controller.count);

  Widget lodeMore(CoinzItemController controller) => RefreshIndicator(
        onRefresh: () => controller.refreshing(),
        child: listOfCoinzItem(controller),
      );
  Widget coinzListItem(index, CoinzItemController controller) {
    return InkWell(
      onTap: () {
        // if (homeController.favouritesModel!.favourites!.length < 4) {
        controller.addFavourite(
          Get.find<HomeController>().currenciesItem![index].sCode!,
        );
        // }
      },
      child: Container(
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
                      imageUrl: controller.getImageUrl(index),
                      imageBuilder: (context, imageProvider) =>
                          Image(image: imageProvider),
                      errorWidget: (context, url, error) => CircleAvatar(
                        backgroundColor: ColorManager.lightGreyBorder,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
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
      ),
    );
  }
}
