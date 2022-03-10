import 'package:coinz_app/constant/enums.dart';

import '../../constant/string_manager.dart';
import 'package:get/get.dart';

class AlartCoinzController extends GetxController {
  String dropdownValue =alartValue(AlartValue.EQUAL);

  changeDropdownItem(value) {
    dropdownValue = value;
    update();
  }
}
