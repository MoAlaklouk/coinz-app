import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/color_manger.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/icon_manager.dart';
import '../../constant/string_manager.dart';
import '../../constant/style_manager.dart';
import '../../constant/value_manager.dart';
import '../news/news_controller.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({Key? key}) : super(key: key);
  int newsIndex = Get.arguments;
  NewsController newsController = NewsController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppString.shareString,
              style: getMediumStyle(
                  color: ColorManager.black, fontSize: FontSizeManager.s14.sp),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            titelNewsDetails(),
            dateNews(),
            SizedBox(
              height: AppHeightSize.sh11,
            ),
            newsImage(),
            SizedBox(
              height: AppHeightSize.sh14,
            ),
            socialMediaButton(),
            SizedBox(
              height: AppHeightSize.sh4,
            ),
            newsBodyText()
          ],
        ),
      ),
    );
  }

  Widget titelNewsDetails() => Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m27),
        child: Text(
          newsController.newstitle(newsIndex),
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSizeManager.s20),
        ),
      );
  Widget dateNews() => Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m27),
        alignment: Alignment.centerRight,
        child: Text(
          newsController.newsDate(newsIndex),
          style: getSemiBoldStyle(
              color: ColorManager.lightGrey, fontSize: FontSizeManager.s12),
        ),
      );
  Widget newsImage() => CachedNetworkImage(
        imageUrl: newsController.newsImage(newsIndex),
        imageBuilder: (context, image) => Container(
          width: double.infinity,
          height: AppHeightSize.sh200,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: double.infinity,
          height: AppHeightSize.sh200,
          color: ColorManager.lightGreyBorder,
        ),
        placeholder: (context, url) => Container(
          width: double.infinity,
          height: AppHeightSize.sh200,
          color: ColorManager.lightGreyBorder,
        ),
      );

  Widget socialMediaButton() => Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m27),
        height: AppHeightSize.sh28,
        child: Row(
          children: [
            Container(
              width: AppWidthSize.sw123,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.facebookBlue),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppString.facebookShare,
                  style: getRegularStyle(color: ColorManager.white),
                ),
              ),
            ),
            SizedBox(
              width: AppWidthSize.sw10,
            ),
            Container(
              width: AppWidthSize.sw100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.twitterBlue),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppString.twitterShare,
                  style: getRegularStyle(color: ColorManager.white),
                ),
              ),
            ),
            SizedBox(
              width: AppWidthSize.sw10,
            ),
            Container(
              height: AppHeightSize.sh28,
              width: AppWidthSize.sw29,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.lightGreyBorder),
              child: Icon(
                IconManager.share,
                color: ColorManager.grey,
              ),
            )
          ],
        ),
      );
  Widget newsBodyText() {

    return Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m27),
        child: Html(
          data: newsController.newsbody(newsIndex),
        )
      );
  }
}
