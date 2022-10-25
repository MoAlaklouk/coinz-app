import 'package:flutter/material.dart';

import '../../api/api_key.dart';
import '../../api/methods.dart';

import '../../api/api.dart';
import '../../app/my_app_controller.dart';
import '../../utils/utils.dart';
import '../../model/coinz_model.dart';
import '../../model/state_model.dart';

import '../home/home_controller.dart';
import '../layout/layout_controller.dart';
import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  MyAppController myAppController = Get.find();
  HomeController homeController = Get.find();

  void onInit() {
    getCurrencies(pageCount: coinzPageCount, pageNumber: page_number);
    addLoadMoreTrigger();
    super.onInit();
  }

  ScrollController scrollController = ScrollController();
  bool isLoadingRequest = false;

  addLoadMoreTrigger() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        loadMore();
      }
    });
  }

  bool stopLoadMore = false;

  var page_number = 1;

  List<Currencies> listOfCoinz = [];

  bool isCurrencieslaod = false;
  getCurrencies({
    required int pageCount,
    required int pageNumber,
  }) {
    isCurrencieslaod = false;
    update();

    ApiRequest(
      path: CURRENCIES,
      method: getMethod,
      queryParameters: {
        'i_page_count': pageCount,
        'i_page_number': pageNumber,
      },
    ).request(
      onSuccess: (data, response) {
        coinzPageNum++;
        update();
        CurrenciesModel currenciesModel = CurrenciesModel.fromJson(response);
        listOfCoinz.addAll(
          List.generate(
              coinzPageCount, (index) => currenciesModel.currencies![index]),
        );
        if (currenciesModel.currencies!.isEmpty) stopLoadMore = true;

        isCurrencieslaod = true;
        update();
      },
      onError: (error) {
        isCurrencieslaod = true;

        print(error.toString());
        update();
      },
    );
  }

  int get count => listOfCoinz.length;

  void loadMore() async {
    if (stopLoadMore) return;
    List<Currencies> loadMoreList = [];
    page_number += 1; 
    update();
    getCurrencies(pageCount: coinzPageCount, pageNumber: page_number);
    listOfCoinz.addAll(loadMoreList);
    update();
  }

  Future<void> refreshing() async {
    listOfCoinz.clear();
    page_number = 1;
    stopLoadMore = false;
    getCurrencies(pageCount: coinzPageCount, pageNumber: page_number);
  }

  String getNameCoinz(int index) {
    int indexOfSubString = listOfCoinz[index].sName!.indexOf('(');
    return listOfCoinz[index].sName!.substring(0, indexOfSubString);
  }

  String getImageUrl(int index) {
    return listOfCoinz[index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length = listOfCoinz[index].dValue!.length;
    int indexOfSubString = listOfCoinz[index].dValue!.indexOf('.');
    if (indexOfSubString == -1) {
      return listOfCoinz[index].dValue!;
    } else {
      if (length > indexOfSubString + 2) {
        return listOfCoinz[index].dValue!.substring(0, indexOfSubString + 3);
      } else {
        return listOfCoinz[index].dValue!;
      }
    }
  }

  String getTradingOfCoinz(int index) {
    return listOfCoinz[index].dTrading!;
  }

  AddModel? addModel;
  void addFavourite(String s_currency) {
    ApiRequest(
        path: ADDFAVOURITES,
        method: postMethod,
        withLoading: true,
        body: {
          's_currency': s_currency,
          's_udid': myAppController.deviceinfo['id'],
        }).request(
      onSuccess: (data, response) {
        addModel = AddModel.fromJson(response);
        Get.snackbar('تنبه', '${addModel!.status!.message}');
        homeController.getFavouritesCoinz();
      },
    );
  }
}
