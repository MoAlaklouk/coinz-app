import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/color_manger.dart';
import '../../../constant/fonts_manager.dart';
import '../../../constant/style_manager.dart';

/// show alert
showMessage({
  String? description,
  String? type,
  Color? textColor,
  bool withBackground = true,
}) {
  Get.snackbar(
    'تنبيه'.tr,
    description!,
    titleText: Text(
      'تنبيه'.tr,
      style: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s14.sp),
    ),
    messageText: Text(
      description,
      style: getSemiBoldStyle(
          color: ColorManager.white, fontSize: FontSize.s12.sp),
    ),
    backgroundColor: withBackground ? ColorManager.primary : null,
    barBlur: 2,
  );
}

/// show popup
showPopUp({Widget? child}) {
  Get.dialog(
    child!,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
  );
}
