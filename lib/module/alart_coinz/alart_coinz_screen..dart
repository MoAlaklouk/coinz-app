import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinz_app/module/home/home_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/loading.dart';
import '../../helper/assets_helper.dart';
import '../../helper/color_helper.dart';
import '../../helper/enums.dart';
import '../../helper/string_manager.dart';
import '../../helper/style_manager.dart';
import '../../model/coinz_model.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 38.h,
                  ),
                  alartScreenTitel(),
                  alartScreenCaptionTital(),
                  SizedBox(
                    height: 9.h,
                  ),
                  selectCoinzDropdown(),
                  SizedBox(
                    height: 18.h,
                  ),
                  selectAlartTitel(),
                  SizedBox(
                    height: 9.h,
                  ),
                  alartDetailsButton(controller),
                  SizedBox(
                    height: 21.h,
                  ),
                  newAlartButton(controller),
                  SizedBox(
                    height: 31.h,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20.h,
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
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          AppString.alartTital,
          style: getSemiBoldStyle(color: ColorManager.black, fontSize: 20.sp),
        ),
      );
  Widget alartScreenCaptionTital() => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
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
        items: Get.find<HomeController>().currenciesItem,
        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.green,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
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
        padding: EdgeInsets.all(8.w),
        child: Row(children: [
          if (item?.sIcon != null)
            CachedNetworkImage(
                imageUrl: item?.sIcon ?? '',
                imageBuilder: (context, image) => Container(
                      height: 20.h,
                      child: Image(image: image),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error)),
          SizedBox(
            width: 14.w,
          ),
          Text(
            item?.sName ?? 'اختار العملة',
            style: getRegularStyle(color: ColorManager.black, fontSize: 16.sp),
          ),
        ]),
      );

  Widget selectAlartTitel() => Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 29.w),
        child: Text(
          AppString.selectAlartTital,
          style: getRegularStyle(
            color: ColorManager.grey,
            fontSize: 12.sp,
          ),
        ),
      );

  Widget alartDetailsButton(AlartCoinzController controller) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lightGreyBorder),
          borderRadius: BorderRadius.circular(8)),
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
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsManager.newAlartButtonImage),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
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
              style:
                  getRegularStyle(color: ColorManager.black, fontSize: 17.sp),
            )),
      );

  Widget listOfAlart(controller, context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => alartItem(controller, index, context),
      separatorBuilder: (context, index) => SizedBox(
            height: 12.h,
          ),
      itemCount: alartModel!.condition!.length);

  Widget alartItem(AlartCoinzController controller, index, context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lightGreyBorder),
          borderRadius: BorderRadius.circular(8.r)),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 17.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: controller.getCoinzImageUrl(index),
              imageBuilder: (context, image) => Image(
                image: image,
                height: 20.h,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              placeholder: (context, url) => CircleAvatar(
                radius: 10.r,
                backgroundColor: ColorManager.lightGreyBorder,
              ),
            ),
            SizedBox(
              width: 14.w,
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
                          color: ColorManager.black, fontSize: 15.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      controller.getIType(index),
                      style: getRegularStyle(
                          color: ColorManager.green, fontSize: 14.sp),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      controller.getValueOfCoinz(index),
                      style: getRegularStyle(
                          color: ColorManager.green, fontSize: 15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AppString.dollarSign,
                      style: getRegularStyle(
                        color: ColorManager.green,
                        fontSize: 15.sp,
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
              icon: Icon(Icons.delete),
              color: ColorManager.green,
            ),
          ],
        ),
      ),
    );
  }
}
