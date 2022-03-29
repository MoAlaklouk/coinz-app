import '../../app/my_app_controller.dart';
import '../../constant/helper.dart';
import '../../data/model/coinz_model.dart';
import '../../data/model/state_model.dart';
import '../../data/network/api_key.dart';
import '../../data/network/remote/api.dart';
import '../../data/network/remote/methods.dart';
import '../home/home_controller.dart';
import '../layout/layout_controller.dart';
import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  void onInit() {
    super.onInit();

    load();
  }

  MyAppController myAppController = Get.find();
  final LayoutController _layoutController = LayoutController.instance;
  final HomeController _homeController = HomeController.instance;

  int get count => listOfCoinzItem.length;

  List<Currencies> listOfCoinzItem = [];

  void load() {
    print("load");

    _layoutController.getCurrencies(
        pageCount: coinzPageCount, pageNumber: coinzPageNum);

    listOfCoinzItem.addAll(
      List.generate(coinzPageCount, (v) => currenciesItem![v]),
    );

    print("data count = ${currenciesItem!.length}");

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
    int indexOfSubString = currenciesItem![index].sName!.indexOf('(');
    return currenciesItem![index].sName!.substring(0, indexOfSubString);
  }

  String getImageUrl(int index) {
    return currenciesItem![index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    var length = currenciesItem![index].dValue!.length;
    int indexOfSubString = currenciesItem![index].dValue!.indexOf('.');
    if (indexOfSubString == -1) {
      return currenciesItem![index].dValue!;
    } else {
      if (length > indexOfSubString + 2) {
        return currenciesItem![index]
            .dValue!
            .substring(0, indexOfSubString + 3);
      } else {
        return currenciesItem![index].dValue!;
      }
    }
  }

  String getTradingOfCoinz(int index) {
    return currenciesItem![index].dTrading!;
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
        _homeController.getFavouritesCoinz();
      },
    );
  }
}
