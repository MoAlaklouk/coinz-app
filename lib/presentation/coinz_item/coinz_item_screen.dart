import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinz_app/constant/assets_manager.dart';
import 'package:coinz_app/constant/color_manger.dart';
import 'package:coinz_app/constant/fonts_manager.dart';
import 'package:coinz_app/constant/string_manager.dart';
import 'package:coinz_app/constant/style_manager.dart';
import 'package:coinz_app/constant/value_manager.dart';
import 'package:coinz_app/presentation/coinz_item/coinz_item_controller.dart';
import 'package:coinz_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class CoinzItemScreen extends StatelessWidget {
  CoinzItemScreen({Key? key}) : super(key: key);
  CoinzItemController coinzItemController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinzItemController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: AppSize.s0,
        ),
        body: GetBuilder<CoinzItemController>(
          builder: (controller) => Column(
            children: [
              titelBar(),
              SizedBox(
                height: AppHeightSize.sh10,
              ),
              Expanded(child: lodeMore(controller)),
            ],
          ),
        ),
      ),
    );
  }

  Widget listOfCoinzItem(controller) => ListView.separated(
      itemBuilder: (context, index) => coinzListItem(index, controller),
      separatorBuilder: (context, index) => SizedBox(
            height: AppHeightSize.sh10,
          ),
      itemCount: controller.count);

  Widget lodeMore(CoinzItemController controller) => RefreshIndicator(
        onRefresh: () => controller.refreshing(),
        child: LoadMore(
          isFinish: controller.count >= 100,
          onLoadMore: () => controller.loadMore(),
          child: listOfCoinzItem(controller),
          whenEmptyLoad: false,
          textBuilder: (status) {
            if (status == LoadMoreStatus.nomore) {
              return AppString.endLoading;
            } else {
              return AppString.isLoading;
            }
          },
        ),
      );
  Widget coinzListItem(index, CoinzItemController controller) => Container(
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
                    width: AppWidthSize.sw12,
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
