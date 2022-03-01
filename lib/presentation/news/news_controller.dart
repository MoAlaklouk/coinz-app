import 'package:get/get.dart';

class NewsController extends GetxController {
  Future<bool> loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    return true;
  }
}
