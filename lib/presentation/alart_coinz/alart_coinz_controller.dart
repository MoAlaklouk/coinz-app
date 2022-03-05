import 'dart:ffi';

import 'package:get/get.dart';

class AlartCoinzController extends GetxController {
  String dropdownValue = 'يساوي';

  changeDropdownItem(value) {
    dropdownValue = value;
    update();
  }
}
