import 'package:cached_network_image/cached_network_image.dart';
import '../../api/loading.dart';

import '../../app/app_router/app_router.dart';
import '../../helper/assets_helper.dart';
import '../../helper/color_helper.dart';
import '../../helper/fonts_manager.dart';
import '../../utils/utils.dart';
import '../../helper/string_manager.dart';
import '../../helper/style_manager.dart';
import 'news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (controller) => MyBuildCondition(
        condition: controller.newsItem!.isNotEmpty,
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 38.h,
                ),
                newsTitel(),
                SizedBox(
                  height: 5.h,
                ),
                // Expanded(child: listNews()),
                Expanded(child: lodeMore(controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget newsTitel() => Container(
        alignment: Alignment.centerRight,
        child: Text(
          AppString.newsTitel,
          style: getSemiBoldStyle(
            color: ColorManager.black,
            fontSize: 27.sp,
          ),
        ),
      );

  Widget listNews(NewsController controller) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => newsItem(controller, index),
      separatorBuilder: (context, index) => SizedBox(
        height: 10.h,
      ),
      itemCount: controller.count,
    );
  }

  Widget newsItem(NewsController controller, index) => InkWell(
        onTap: () {
          Get.toNamed(Routes.newsDetailsRoute, arguments: index);
        },
        child: Container(
          height: 107.h,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.lightGreyBorder),
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: controller.newsImage(index),
                imageBuilder: (context, image) => Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 123.w,
                  height: 94.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorManager.lightGreyBorder),
                    image: DecorationImage(image: image, fit: BoxFit.cover),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                    width: 123.w,
                    height: 94.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorManager.lightGreyBorder)),
                placeholder: (context, url) => Container(
                    width: 123.w,
                    height: 94.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorManager.lightGreyBorder)),
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5.w),
                  height: 90.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 65.h,
                        child: Text(
                          controller.newstitle(index),
                          maxLines: 4,
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text(
                          controller.newsDate(index),
                          style: getMediumStyle(
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget lodeMore(NewsController controller) {
    return RefreshIndicator(
      onRefresh: () => controller.refreshing(),
      child: LoadMore(
        whenEmptyLoad: false,
        isFinish: controller.end,
        onLoadMore: () {
          return controller.loadMore();
        },
        child: listNews(controller),
        textBuilder: (status) {
          if (status == LoadMoreStatus.nomore)
            return AppString.endLoading;
          else
            return AppString.isLoading;
        },
      ),
    );
  }
}
