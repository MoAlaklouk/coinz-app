import 'package:coinz_app/constant/helper.dart';
import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/data/model/state_model.dart';
import 'package:coinz_app/data/network/api_key.dart';
import 'package:coinz_app/data/network/remote/api.dart';
import 'package:coinz_app/data/network/remote/methods.dart';
import 'package:coinz_app/presentation/home/home_controller.dart';
import 'package:coinz_app/presentation/layout/layout_controller.dart';
import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  void onInit() {
    super.onInit();
    load();
  }

  final LayoutController _layoutController = LayoutController.instance;
  final HomeController _homeController = HomeController.instance;

  int get count => listOfCoinzItem.length;

  List<Currencies> listOfCoinzItem = [];

  void load() {
    print("load");

    _layoutController.getCurrencies(
        pageCount: coinzPageCount, pageNumber: coinzPageNum);

    listOfCoinzItem.addAll(
      List.generate(coinzPageCount, (v) => _layoutController.currenciesItem![v]),
    );

    print("data count = ${_layoutController.currenciesItem!.length}");

    print("data count2 = $count");

    update();
  }

  Future<bool> loadMore() async {
    print("onLoadMore");

  

    await Future.delayed(Duration(seconds: 0, milliseconds: 700));
    load();

    return true;
  }

  Future<void> refreshing() async {
    coinzPageNum = 1;
    print("refresh");
    await Future.delayed(Duration(seconds: 0, milliseconds: 700));

    listOfCoinzItem.clear();

    load();
  }

  String getNameCoinz(int index) {
    int indexOfSubString =
        _layoutController.currenciesItem![index].sName!.indexOf('(');
    return _layoutController.currenciesItem![index].sName!
        .substring(0, indexOfSubString);
  }

  String getImageUrl(int index) {
    return _layoutController.currenciesItem![index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length = _layoutController.currenciesItem![index].dValue!.length;
    int indexOfSubString =
        _layoutController.currenciesItem![index].dValue!.indexOf('.');
    if (length > indexOfSubString + 2) {
      return _layoutController.currenciesItem![index].dValue!
          .substring(0, indexOfSubString + 3);
    } else {
      return _layoutController.currenciesItem![index].dValue!;
    }
  }

  String getTradingOfCoinz(int index) {
    return _layoutController.currenciesItem![index].dTrading!;
  }

  AddModel? addModel;
  void addFavourite(String s_currency, int s_udid) {
    ApiRequest(
        path: ADDFAVOURITES,
        method: postMethod,
        withLoading: true,
        body: {
          's_currency': s_currency,
          's_udid': s_udid,
        }).request(
      onSuccess: (data, response) {
        addModel = AddModel.fromJson(response);
        Get.snackbar('تنبه', '${addModel!.status!.message}');
        _homeController.getFavouritesCoinz();
      },
    );
  }
}
