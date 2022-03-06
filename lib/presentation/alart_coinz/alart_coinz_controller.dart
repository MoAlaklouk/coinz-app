import 'dart:ffi';

import '../../constant/string_manager.dart';
import 'package:get/get.dart';

class AlartCoinzController extends GetxController {
  String dropdownValue = AppString.equalString;

  changeDropdownItem(value) {
    dropdownValue = value;
    update();
  }
}
