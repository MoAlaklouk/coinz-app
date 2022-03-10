import 'package:coinz_app/data/model/coinz_model.dart';
import 'package:coinz_app/data/network/api_key.dart';
import 'package:coinz_app/data/network/remote/api.dart';
import 'package:coinz_app/data/network/remote/methods.dart';
import 'package:get/get.dart';

class CoinzItemController extends GetxController {
  void onInit() {
    getCurrencies(page_count: 15, page_number: pageNum);
    super.onInit();
    listOfCoinzItem.addAll(List.generate(15, (v) => v));
  }

  int get count => listOfCoinzItem.length;
  int pageNum = 1;
  List<int> listOfCoinzItem = [];

  void load() {
    print("load");

    listOfCoinzItem.addAll(List.generate(15, (v) => v));
    print("data count = ${listOfCoinzItem.length}");
    update();
  }

  Future<bool> loadMore() async {
    pageNum++;
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> refreshing() async {
    pageNum = 1;
    print("refresh");
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    listOfCoinzItem.clear();
    load();
  }

  CurrenciesModel? currenciesModel;
  void getCurrencies({
    required int page_count,
    required int page_number,
  }) {
    ApiRequest(
      path: currencies_list,
      method: getMethod,
      queryParameters: {
        'i_page_count': page_count,
        'i_page_number': page_number,
      },
    ).request(
      onSuccess: (data, response) {
        currenciesModel = CurrenciesModel.fromJson(response);
      },
      onError: (error) {
        print(error.toString());
      },
    );
  }
}
