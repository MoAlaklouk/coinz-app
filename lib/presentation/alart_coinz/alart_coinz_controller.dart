import 'package:coinz_app/constant/helper.dart';
import 'package:coinz_app/data/model/alart_model.dart';

import '../../app/my_app_controller.dart';
import '../../constant/enums.dart';
import '../../data/network/api_key.dart';
import '../../data/network/remote/api.dart';
import '../../data/network/remote/methods.dart';

import 'package:get/get.dart';

class AlartCoinzController extends GetxController {
  @override
  void onInit() {
    getTriggers();

    super.onInit();
  }

  MyAppController myAppController = Get.find();
  String dropdownValue = alartValue(AlartValue.EQUAL);

  changeDropdownItem(value) {
    dropdownValue = value;
    update();
  }

  void addAlart(
      {required String sCode,
      required int iType,
      required String dValue,
      required String sPnsToken}) {
    ApiRequest(
            path: ADDALART,
            method: postMethod,
            body: {
              's_code': sCode,
              'i_type': iType,
              'd_value': dValue,
              's_udid': myAppController.deviceinfo['id'],
              's_pns_token': massageToken,
            },
            withLoading: true)
        .request(onSuccess: (data, response) {
      Get.snackbar('تنبه', '${response['status']['message']}');
      dismissKeyboard();

      getTriggers();
      print(response);
    }, onError: (error) {
      Get.snackbar('تنبه', '${error['status']['message']}');
      dismissKeyboard();
    });
  }

  void getTriggers() {
    ApiRequest(
      path: GETALART,
      method: getMethod,
    ).request(
      onSuccess: (data, response) {
        alartModel = AlartModel.fromJson(response);
        update();
      },
    );
  }

  void deleteAlart({required int id}) {
    ApiRequest(
        path: ADDALART,
        method: deleteMethod,
        withLoading: true,
        queryParameters: {'id': id}).request(
      onSuccess: (data, response) {
        getTriggers();
      },
    );
  }

  String getNameCoinz(int index) {
    int indexOfSubString = alartModel!.condition![index].sName!.indexOf('(');
    return alartModel!.condition![index].sName!.substring(0, indexOfSubString);
  }

  String getCoinzImageUrl(int index) {
    return alartModel!.condition![index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length = alartModel!.condition![index].dValue!.length;
    int indexOfSubString = alartModel!.condition![index].dValue!.indexOf('.');
    if (indexOfSubString == -1) {
      return alartModel!.condition![index].dValue!;
    } else {
      if (length > indexOfSubString + 2) {
        return alartModel!.condition![index].dValue!
            .substring(0, indexOfSubString + 3);
      } else {
        return alartModel!.condition![index].dValue!;
      }
    }
  }

  String getIType(int index) {
    String type = '';
    if (alartModel!.condition![index].iType == '1') {
      type = alartValue(AlartValue.LESSTHAN);
    }
    if (alartModel!.condition![index].iType == '2') {
      type = alartValue(AlartValue.EQUAL);
    }
    if (alartModel!.condition![index].iType == '3') {
      type = alartValue(AlartValue.MORETHAN);
    }
    return type;
  }
}

AlartModel? alartModel;
