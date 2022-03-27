import '../../app/my_app_controller.dart';
import '../../constant/enums.dart';
import '../../data/network/api_key.dart';
import '../../data/network/remote/api.dart';
import '../../data/network/remote/methods.dart';

import 'package:get/get.dart';

class AlartCoinzController extends GetxController {
  MyAppController myAppController = Get.find();
  String dropdownValue = alartValue(AlartValue.EQUAL);

  changeDropdownItem(value) {
    dropdownValue = value;
    update();
  }

  void addAlart(
      {required String sCode,
      required int iType,
      required double dValue,
   
      required String sPnsToken}) {
    ApiRequest(path: ADDALART, method: postMethod, body: {
      's_code': sCode,
      'i_type': iType,
      'd_value': dValue,
      's_udid': myAppController.deviceData['id'],
      's_pns_token':sPnsToken,
    });
  }
}
