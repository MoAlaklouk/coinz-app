import 'package:get/get.dart';

class NewsController extends GetxController {
  void onInit() {
    super.onInit();
    list.addAll(List.generate(10, (v) => v));
  }

  int get count => list.length;

  List<int> list = [];

  void load() {
    print("load");

    list.addAll(List.generate(10, (v) => v));
    print("data count = ${list.length}");
    update();
  }

  Future<bool> loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds:0, milliseconds: 2000));
    load();
    return true;
  }

}
