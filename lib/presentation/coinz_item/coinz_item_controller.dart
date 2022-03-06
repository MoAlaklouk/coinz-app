import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  void onInit() {
    super.onInit();
    listOfCoinzItem.addAll(List.generate(15, (v) => v));
  }

  int get count => listOfCoinzItem.length;

  List<int> listOfCoinzItem = [];

  void load() {
    print("load");

    listOfCoinzItem.addAll(List.generate(10, (v) => v));
    print("data count = ${listOfCoinzItem.length}");
    update();
  }

  Future<bool> loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }
}
