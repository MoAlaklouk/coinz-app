import 'package:coinz_app/constant/helper.dart';
import 'package:coinz_app/presentation/layout/layout_controller.dart';
import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  void onInit() {
    super.onInit();
    listOfCoinzItem.addAll(List.generate(15, (v) => v));
    pageNum = 1;
  }

  final LayoutController _layoutController = LayoutController.instance;

  int get count => listOfCoinzItem.length;

  List<int> listOfCoinzItem = [];

  void load() {
    print("load");
    pageNum++;
    _layoutController.getCurrencies(
        page_count: pageNum, page_number: pageCount);
    listOfCoinzItem.addAll(List.generate(pageCount, (v) => v));
    print("data count = ${listOfCoinzItem.length}");
    update();
  }

  Future<bool> loadMore() async {
    print("onLoadMore");

    load();
    ++pageNum;

    return true;
  }

  Future<void> refreshing() async {
    pageNum = 1;
    print("refresh");
    listOfCoinzItem.clear();
    load();
  }

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
    return _layoutController.currenciesModel!.currencies![index].dValue!;
  }

  String getTradingOfCoinz(int index) {
    return _layoutController.currenciesModel!.currencies![index].dTrading!;
  }
}
