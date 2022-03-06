import '../../app/app_router/app_router.dart';
import '../../constant/assets_manager.dart';
import '../../constant/color_manger.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/helper.dart';
import '../../constant/string_manager.dart';
import '../../constant/style_manager.dart';
import '../../constant/value_manager.dart';
import 'news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p21),
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: AppHeightSize.sh38,
              ),
              newsTitel(),
              SizedBox(
                height: AppHeightSize.sh5,
              ),
              // Expanded(child: listNews()),
              Expanded(child: lodeMore(controller)),
            ],
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
            fontSize: FontSize.s27.sp,
          ),
        ),
      );

  Widget listNews(NewsController controller) => ListView.separated(
        itemBuilder: (context, index) => newsItem(),
        separatorBuilder: (context, index) => SizedBox(
          height: AppHeightSize.sh10,
        ),
        itemCount: controller.count,
        physics: BouncingScrollPhysics(),
      );

  Widget newsItem() => InkWell(
        onTap: () {
          Get.toNamed(Routes.newsDetails);
        },
        child: Container(
          height: 107.h,
          padding: EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s8),
            border: Border.all(color: ColorManager.lightGreyBorder),
          ),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: AppWidthSize.sw123,
                height: AppHeightSize.sh94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  border: Border.all(color: ColorManager.lightGreyBorder),
                  image: const DecorationImage(
                      image: AssetImage(
                        AssetsManager.rectangle,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: AppWidthSize.sw11,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: AppMargin.m5),
                  height: AppHeightSize.sh90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppHeightSize.sh65,
                        child: Text(
                          'انتعاش في قيمة العملات الرقمية الرئيسية تمثلت بارتفاع كل من البيتكوين والاثيريوم وكاردانو',
                          maxLines: 4,
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text(
                          dateFormat(
                            DateTime.now(),
                          ),
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

  Widget lodeMore(NewsController controller) => Container(
        child: LoadMore(
          isFinish: controller.count >= 60,
          onLoadMore: controller.loadMore,
          child: listNews(controller),
          whenEmptyLoad: false,
          textBuilder: (status) {
            if (status == LoadMoreStatus.nomore)
              return AppString.endLoading;
            else
              return AppString.isLoading;
          },
        ),
      );
}
