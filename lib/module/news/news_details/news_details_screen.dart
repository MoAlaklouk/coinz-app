import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helper/color_helper.dart';
import '../../../helper/fonts_manager.dart';
import '../../../helper/string_manager.dart';
import '../../../helper/style_manager.dart';
import '../news_controller.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({Key? key}) : super(key: key);
  int newsIndex = Get.arguments;
  NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppString.shareString,
              style: getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
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
              height: 11.h,
            ),
            newsImage(),
            SizedBox(
              height: 14.h,
            ),
            socialMediaButton(),
            SizedBox(
              height: 4.h,
            ),
            newsBodyText()
          ],
        ),
      ),
    );
  }

  Widget titelNewsDetails() => Container(
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        child: Text(
          newsController.newstitle(newsIndex),
          style: getSemiBoldStyle(color: ColorManager.black, fontSize: 20),
        ),
      );
  Widget dateNews() => Container(
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        alignment: Alignment.centerRight,
        child: Text(
          newsController.newsDate(newsIndex),
          style: getSemiBoldStyle(color: ColorManager.lightGrey, fontSize: 12),
        ),
      );
  Widget newsImage() => CachedNetworkImage(
        imageUrl: newsController.newsImage(newsIndex),
        imageBuilder: (context, image) => Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: double.infinity,
          height: 200.h,
          color: ColorManager.lightGreyBorder,
        ),
        placeholder: (context, url) => Container(
          width: double.infinity,
          height: 200.h,
          color: ColorManager.lightGreyBorder,
        ),
      );

  Widget socialMediaButton() => Container(
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        height: 28.h,
        child: Row(
          children: [
            Container(
              width: 123.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
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
              width: 10.w,
            ),
            Container(
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
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
              width: 10.w,
            ),
            Container(
              height: 28.h,
              width: 29.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.lightGreyBorder),
              child: Icon(
                Icons.share,
                color: ColorManager.grey,
              ),
            )
          ],
        ),
      );
  Widget newsBodyText() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        child: Html(
          data: newsController.newsbody(newsIndex),
        ));
  }
}
