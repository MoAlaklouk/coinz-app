import '../../data/model/favourite_model.dart';
import '../../data/network/api_key.dart';
import '../../data/network/remote/api.dart';
import '../../data/network/remote/methods.dart';
import '../coinz_item/coinz_item_controller.dart';
import '../layout/layout_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getFavouritesCoinz();

    super.onInit();
  }

  HomeController._();
  static late final HomeController _instance = HomeController._();
  static HomeController get instance => _instance;
  factory HomeController() {
    return _instance;
  }

  LayoutController _layoutController = LayoutController.instance;

  bool islaod = true;

  String getNameCoinz(int index) {
    int indexOfSubString = _layoutController
        .currenciesModel!.currencies![index].sName!
        .indexOf('(');
    return _layoutController.currenciesModel!.currencies![index].sName!
        .substring(0, indexOfSubString);
  }

  String getCoinzImageUrl(int index) {
    return _layoutController.currenciesModel!.currencies![index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length =
        _layoutController.currenciesModel!.currencies![index].dValue!.length;
    int indexOfSubString = _layoutController
        .currenciesModel!.currencies![index].dValue!
        .indexOf('.');
    if (indexOfSubString == -1) {
      return _layoutController.currenciesModel!.currencies![index].dValue!;
      
    } else {
      if (length > indexOfSubString + 2) {
        return _layoutController.currenciesModel!.currencies![index].dValue!
            .substring(0, indexOfSubString + 3);
      } else {
        return _layoutController.currenciesModel!.currencies![index].dValue!;
      }
    }
  }

  String getTradingOfCoinz(int index) {
    return _layoutController.currenciesModel!.currencies![index].dTrading!;
  }

  FavouritesModel? favouritesModel;
  void getFavouritesCoinz() {
    islaod = false;

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
