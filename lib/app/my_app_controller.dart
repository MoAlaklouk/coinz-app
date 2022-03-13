import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/data/network/remote/api.dart';
import 'package:coinz_app/data/network/remote/methods.dart';
import 'package:get/get.dart';

import '../data/network/api_key.dart';
import '../data/network/local/local_storage.dart';
import '../data/network/remote/log.dart';

class MyAppController extends GetxController {
  dynamic userData;
  dynamic token;

  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() async {
    super.onInit();
    token = await localStorage.getFromStorage(key: tokenKey);

    userData = await localStorage.getFromStorage(key: cUserData);
    consoleLog(userData);
    consoleLog(token);
  }

  void onUserAuthenticated(userDataValue) {
    localStorage.saveToStorage(key: cUserData, value: userDataValue);
    userData = userDataValue;
    consoleLog(userDataValue);
    update();
  }

  void onUserUpdated(userDataValue) {
    localStorage.saveToStorage(key: cUserData, value: userDataValue);
    userData = userDataValue;
    consoleLog(userDataValue);
    update();
  }

  void onSignOut() {
    localStorage.erase();
    userData = null;
    token = null;

    update();
  }

 
}
