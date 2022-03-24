import 'dart:io';

import 'package:coinz_app/app/device_info.dart';
import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/data/network/remote/api.dart';
import 'package:coinz_app/data/network/remote/methods.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
    initPlatformState();
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

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> deviceData = <String, dynamic>{};
  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData = readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          deviceData = readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData =
              readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    deviceData = deviceData;
    update();
    print(deviceData['id']);
  }
}
