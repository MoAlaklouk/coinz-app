import 'package:coinz_app/data/model/favourite_model.dart';
import 'package:coinz_app/data/network/api_key.dart';
import 'package:coinz_app/data/network/remote/api.dart';
import 'package:coinz_app/data/network/remote/methods.dart';
import 'package:coinz_app/presentation/layout/layout_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getFavouritesCoinz();
    super.onInit();
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

  String getImageUrl(int index) {
    return _layoutController.currenciesModel!.currencies![index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length =
        _layoutController.currenciesModel!.currencies![index].dValue!.length;
    int indexOfSubString = _layoutController
        .currenciesModel!.currencies![index].dValue!
        .indexOf('.');
    if (length > indexOfSubString + 2) {
      return _layoutController.currenciesModel!.currencies![index].dValue!
          .substring(0, indexOfSubString + 3);
    } else {
      return _layoutController.currenciesModel!.currencies![index].dValue!;
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
}
