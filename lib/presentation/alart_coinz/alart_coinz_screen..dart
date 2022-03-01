import 'package:coinz_app/constant/assets_manager.dart';
import 'package:coinz_app/constant/color_manger.dart';
import 'package:coinz_app/constant/fonts_manager.dart';
import 'package:coinz_app/constant/icon_manager.dart';
import 'package:coinz_app/constant/string_manager.dart';
import 'package:coinz_app/constant/style_manager.dart';
import 'package:coinz_app/constant/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class AlartScreen extends StatelessWidget {
  const AlartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p23),
        child: Column(
          children: [
            SizedBox(
              height: AppHeightSize.sh38,
            ),
            alartScreenTitel(),
            alartScreenCaptionTital(),
            SizedBox(
              height: AppHeightSize.sh9,
            ),
            selectCoinz(),
            SizedBox(
              height: AppHeightSize.sh18,
            ),
            selectAlartTitel(),
            SizedBox(
              height: AppHeightSize.sh9,
            ),
            alartButton(),
            SizedBox(
              height: AppHeightSize.sh21,
            ),
            newAlartButton(),
            SizedBox(
              height: AppHeightSize.sh31,
            ),
            separator(),
            SizedBox(
              height: AppHeightSize.sh20,
            ),
            Expanded(child: listOfAlart()),
          ],
        ),
      ),
    );
  }

  Widget alartScreenTitel() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m10),
        child: Text(
          AppString.alartTital,
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s20.sp),
        ),
      );
  Widget alartScreenCaptionTital() => Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m5),
        alignment: Alignment.centerRight,
        child: Text(
          AppString.alartTitalCaption,
          style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
        ),
      );
  Widget selectCoinz() => Container(
        height: AppHeightSize.sh56,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.lightGreyBorder),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: AppMargin.m17),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsManager.homeCoinzIcon,
                color: ColorManager.black,
                height: AppHeightSize.sh20,
              ),
              SizedBox(
                width: AppWidthSize.sw14,
              ),
              Text(
                AppString.textfavoriteCoinz,
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s15.sp),
              ),
              SizedBox(
                width: AppWidthSize.sw9,
              ),
              Text(
                AppString.textfavoriteCoinzEn,
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s16.sp),
              ),
              Spacer(),
              Icon(IconManager.arrowDown),
            ],
          ),
        ),
      );

  Widget selectAlartTitel() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: AppMargin.m29),
        child: Text(
          AppString.selectAlartTital,
          style: getRegularStyle(
            color: ColorManager.grey,
            fontSize: 12.sp,
          ),
        ),
      );

  Widget alartButton() => Container( 
        height: AppHeightSize.sh56,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.lightGreyBorder),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: AppHeightSize.sh56,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: ColorManager.lightGreyBorder)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: AppMargin.m17_5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.moreThan,
                        style: getRegularStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s15.sp),
                      ),
                      Spacer(),
                      Icon(IconManager.arrowDown),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${AppString.price} \$',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: AppSize.s15.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      );
  Widget newAlartButton() => Container(
        height: AppHeightSize.sh55,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsManager.newAlartButtonImage),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: TextButton(
            onPressed: () {},
            child: Text(
              AppString.newAlart,
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.s17.sp),
            )),
      );

  Widget separator() => Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: ColorManager.lightGreyBorder, width: AppSize.s1)),
      );
  Widget listOfAlart() => Container(
        child: ListView.separated(
            itemBuilder: (context, index) => alartItem(),
            separatorBuilder: (context, index) => SizedBox(
                  height: AppHeightSize.sh12,
                ),
            itemCount: 2),
      );

  Widget alartItem() => Container(
        height: AppHeightSize.sh56,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.lightGreyBorder),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: AppMargin.m17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsManager.homeCoinzIcon,
                color: ColorManager.black,
                height: AppHeightSize.sh20,
              ),
              SizedBox(
                width: AppWidthSize.sw14,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.textfavoriteCoinz,
                        style: getRegularStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s15.sp),
                      ),
                      SizedBox(
                        width: AppWidthSize.sw9,
                      ),
                      Text(
                        AppString.textfavoriteCoinzEn,
                        style: getRegularStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        AppString.equals,
                        style: getRegularStyle(
                            color: ColorManager.green,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: AppWidthSize.sw9,
                      ),
                      Text(
                        AppString.price,
                        style: getRegularStyle(
                            color: ColorManager.green,
                            fontSize: FontSize.s15.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        AppString.dollarSign,
                        style: getRegularStyle(
                          color: ColorManager.green,
                          fontSize: FontSize.s15.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(IconManager.delete),
                color: ColorManager.green,
              ),
            ],
          ),
        ),
      );
}
