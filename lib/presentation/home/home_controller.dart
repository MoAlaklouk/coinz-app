import 'package:coinz_app/presentation/layout/layout_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  LayoutController _layoutController = LayoutController.instance;

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
