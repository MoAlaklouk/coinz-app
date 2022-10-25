import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../model/coinz_model.dart';
import '../../model/favourite_model.dart';
import '../../api/api_key.dart';
import '../../api/methods.dart';

import '../../api/api.dart';
import '../../utils/utils.dart';
import '../coinz_item/coinz_item_controller.dart';
import '../layout/layout_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getFavouritesCoinz();
    getCurrencies(pageCount: coinzPageCount, pageNumber: coinzPageNum);

    super.onInit();
  }

  List<Currencies>? currenciesItem = [];

  CurrenciesModel? currenciesModel;

  bool isCurrencieslaod = false;
  void getCurrencies({
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

        currenciesModel = CurrenciesModel.fromJson(response);
        currenciesItem!.addAll(List.generate(
          pageCount,
          (index) => currenciesModel!.currencies![index],
        ));
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

  bool islaod = true;

  String getNameCoinz(int index) {
    int indexOfSubString =
        currenciesModel!.currencies![index].sName!.indexOf('(');
    return currenciesModel!.currencies![index].sName!
        .substring(0, indexOfSubString);
  }

  String getCoinzImageUrl(int index) {
    return currenciesModel!.currencies![index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length = currenciesModel!.currencies![index].dValue!.length;
    int indexOfSubString =
        currenciesModel!.currencies![index].dValue!.indexOf('.');
    if (indexOfSubString == -1) {
      return currenciesModel!.currencies![index].dValue!;
    } else {
      if (length > indexOfSubString + 2) {
        return currenciesModel!.currencies![index].dValue!
            .substring(0, indexOfSubString + 3);
      } else {
        return currenciesModel!.currencies![index].dValue!;
      }
    }
  }

  String getTradingOfCoinz(int index) {
    return currenciesModel!.currencies![index].dTrading!;
  }

  FavouritesModel? favouritesModel;
  void getFavouritesCoinz() {
    islaod = false;
    update();
    ApiRequest(
      path: FAVOURITES,
      method: getMethod,
      queryParameters: {
        'i_page_count': 4,
        'i_page_number': 1,
      },
    ).request(
      onSuccess: (data, response) {
        favouritesModel = FavouritesModel.fromJson(response);
        islaod = true;
        update();
      },
      onError: (error) {
        print(error.toString());
        islaod = true;
        update();
      },
    );
  }

  String getNameFavourite(int index) {
    int indexOfSubString =
        favouritesModel!.favourites![index].sName!.indexOf('(');
    return favouritesModel!.favourites![index].sName!
        .substring(0, indexOfSubString);
  }

  String getFavouriteImageUrl(int index) {
    return favouritesModel!.favourites![index].sIcon!;
  }

  String getValueOfFavourite(int index) {
    var length = favouritesModel!.favourites![index].dValue!.length;
    int indexOfSubString =
        favouritesModel!.favourites![index].dValue!.indexOf('.');
    if (length > indexOfSubString + 2) {
      return favouritesModel!.favourites![index].dValue!
          .substring(0, indexOfSubString + 3);
    } else {
      return favouritesModel!.favourites![index].dValue!;
    }
  }
}
