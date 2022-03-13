import 'package:coinz_app/constant/helper.dart';
import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/presentation/layout/layout_controller.dart';
import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  void onInit() {
    super.onInit();
    listOfCoinzItem.addAll(List.generate(
        pageCount, (v) => _layoutController.currenciesModel!.currencies![v]));
    pageNum = 1;
  }

  final LayoutController _layoutController = LayoutController.instance;

  int get count => listOfCoinzItem.length;

  List<Currencies> listOfCoinzItem = [];

  void load() {
    print("load");
    _layoutController.getCurrencies(
        page_count: pageCount, page_number: pageNum);
    listOfCoinzItem.addAll(
      List.generate(
          pageCount, (v) => _layoutController.currenciesModel!.currencies![v]),
    );

    print("data count = ${listOfCoinzItem.length}");

    update();
  }

  Future<bool> loadMore() async {
    print("onLoadMore");

    ++pageNum;
    await Future.delayed(Duration(seconds: 0, milliseconds: 700));
    load();

    return true;
  }

  Future<void> refreshing() async {
    pageNum = 1;
    print("refresh");
    await Future.delayed(Duration(seconds: 0, milliseconds: 700));

    listOfCoinzItem.clear();

    load();
  }

  String getNameCoinz(int index) {
    int indexOfSubString = listOfCoinzItem[index].sName!.indexOf('(');
    return listOfCoinzItem[index].sName!.substring(0, indexOfSubString);
  }

  String getImageUrl(int index) {
    return listOfCoinzItem[index].sIcon!;
  }

  String getValueOfCoinz(int index) {
    return listOfCoinzItem[index].dValue!;
  }

  String getTradingOfCoinz(int index) {
    return listOfCoinzItem[index].dTrading!;
  }
}
