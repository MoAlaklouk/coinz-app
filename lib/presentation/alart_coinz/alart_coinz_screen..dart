import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinz_app/data/network/remote/loading.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/assets_manager.dart';
import '../../constant/color_manger.dart';
import '../../constant/enums.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/icon_manager.dart';
import '../../constant/string_manager.dart';
import '../../constant/style_manager.dart';
import '../../constant/value_manager.dart';
import '../../data/model/coinz_model.dart';
import '../layout/layout_controller.dart';
import 'alart_coinz_controller.dart';

class AlartScreen extends StatelessWidget {
  AlartScreen({Key? key}) : super(key: key);
  TextEditingController alartValueController = TextEditingController();
  var alartValueKey = GlobalKey<FormState>();
  String? currenciesScode = '';
  int iType = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AlartCoinzController>(
        builder: (controller) => MyBuildCondition(
          condition: alartModel != null,
          builder: (context) => Form(
            key: alartValueKey,
            child: Padding(
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
                  selectCoinzDropdown(),
                  SizedBox(
                    height: AppHeightSize.sh18,
                  ),
                  selectAlartTitel(),
                  SizedBox(
                    height: AppHeightSize.sh9,
                  ),
                  alartDetailsButton(controller),
                  SizedBox(
                    height: AppHeightSize.sh21,
                  ),
                  newAlartButton(controller),
                  SizedBox(
                    height: AppHeightSize.sh31,
                  ),
                  Divider(),
                  SizedBox(
                    height: AppHeightSize.sh20,
                  ),
                  Expanded(child: listOfAlart(controller, context)),
                ],
              ),
            ),
          ),
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
              color: ColorManager.black, fontSize: FontSizeManager.s20.sp),
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

  Widget selectCoinzDropdown() => DropdownSearch<Currencies>(
        validator: (value) {
          if (value == null) {
            return 'اختار العملة';
          }
        },
        items: currenciesItem,
        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.green,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppPadding.p12, vertical: AppPadding.p8),
        ),
        onChanged: (data) {
          currenciesScode = data!.sCode!;
        },
        dropdownBuilder: (context, selectedItem) =>
            selectCoinzDropdownItem(context, selectedItem),
        popupItemBuilder: (context, item, isSelected) =>
            selectCoinzDropdownItem(context, item),
      );
  Widget selectCoinzDropdownItem(context, Currencies? item) => Padding(
        padding: EdgeInsets.all(AppPadding.p8),
        child: Row(children: [
          if (item?.sIcon != null)
            CachedNetworkImage(
                imageUrl: item?.sIcon ?? '',
                imageBuilder: (context, image) => Container(
                      height: AppHeightSize.sh20,
                      child: Image(image: image),
                    ),
                errorWidget: (context, url, error) =>
                    const Icon(IconManager.error)),
          SizedBox(
            width: AppWidthSize.sw14,
          ),
          Text(
            item?.sName ?? 'اختار العملة',
            style: getRegularStyle(
                color: ColorManager.black, fontSize: FontSizeManager.s16.sp),
          ),
        ]),
      );

  Widget selectAlartTitel() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: AppMargin.m29),
        child: Text(
          AppString.selectAlartTital,
          style: getRegularStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s12.sp,
          ),
        ),
      );

  Widget alartDetailsButton(AlartCoinzController controller) {
    return Container(
      height: AppHeightSize.sh56,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lightGreyBorder),
          borderRadius: BorderRadius.circular(AppSize.s8)),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: ColorManager.lightGreyBorder))),
            alignment: Alignment.center,
            child: DropdownButton(
              value: controller.dropdownValue,
              underline: Container(),
              items: AlartValue.values
                  .map((e) => DropdownMenuItem(
                      value: alartValue(e),
                      child: Text(
                        '${alartValue(e)}',
                        style: getMediumStyle(color: ColorManager.black),
                      )))
                  .toList(),
              onChanged: (value) {
                if (value == alartValue(AlartValue.MORETHAN)) {
                  iType = 3;
                }
                if (value == alartValue(AlartValue.EQUAL)) {
                  iType = 2;
                }
                if (value == alartValue(AlartValue.LESSTHAN)) {
                  iType = 1;
                }

                controller.changeDropdownItem(value);
              },
            ),
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      errorBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      disabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'حقل مطلوب';
                      }
                    },
                    controller: alartValueController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: ColorManager.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: Text(AppString.dollarSign)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget newAlartButton(AlartCoinzController controller) => Container(
        height: AppHeightSize.sh55,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsManager.newAlartButtonImage),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: TextButton(
            onPressed: () {
              if (alartValueKey.currentState!.validate()) {
                controller.addAlart(
                    sCode: currenciesScode!,
                    iType: iType,
                    dValue: alartValueController.text,
                    sPnsToken: 'massageToken');
              }
            },
            child: Text(
              AppString.newAlart,
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSizeManager.s17.sp),
            )),
      );

  Widget listOfAlart(controller, context) => ListView.separated(
      itemBuilder: (context, index) => alartItem(controller, index, context),
      separatorBuilder: (context, index) => SizedBox(
            height: AppHeightSize.sh12,
          ),
      itemCount: alartModel!.condition!.length);

  Widget alartItem(AlartCoinzController controller, index, context) {
    return Container(
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
            CachedNetworkImage(
              imageUrl: controller.getCoinzImageUrl(index),
              imageBuilder: (context, image) => Image(
                image: image,
                height: AppHeightSize.sh20,
              ),
              errorWidget: (context, url, error) => Icon(IconManager.error),
              placeholder: (context, url) => CircleAvatar(
                radius: AppHeightSize.sh10,
                backgroundColor: ColorManager.lightGreyBorder,
              ),
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
                      controller.getNameCoinz(index),
                      style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeManager.s15.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      controller.getIType(index),
                      style: getRegularStyle(
                          color: ColorManager.green,
                          fontSize: FontSizeManager.s14.sp),
                    ),
                    SizedBox(
                      width: AppWidthSize.sw9,
                    ),
                    Text(
                      controller.getValueOfCoinz(index),
                      style: getRegularStyle(
                          color: ColorManager.green,
                          fontSize: FontSizeManager.s15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AppString.dollarSign,
                      style: getRegularStyle(
                        color: ColorManager.green,
                        fontSize: FontSizeManager.s15.sp,
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
              onPressed: () {
                controller.deleteAlart(
                    id: alartModel!.condition![index].pkIId!);
              },
              icon: Icon(IconManager.delete),
              color: ColorManager.green,
            ),
          ],
        ),
      ),
    );
  }
}
