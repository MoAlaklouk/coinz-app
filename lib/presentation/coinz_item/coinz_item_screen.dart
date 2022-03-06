import 'package:coinz_app/constant/string_manager.dart';
import 'package:coinz_app/constant/value_manager.dart';
import 'package:coinz_app/presentation/coinz_item/coinz_item_controller.dart';
import 'package:coinz_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class CoinzItemScreen extends StatelessWidget {
  const CoinzItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s0,
      ),
      body: GetBuilder<CoinzItemController>(
        builder: (controller) => Column(
          children: [
            titelBar(),
            SizedBox(
              height: AppHeightSize.sh10,
            ),
            Expanded(child: lodeMore(controller)),
          ],
        ),
      ),
    );
  }

  Widget listOfCoinzItem(CoinzItemController controller) => ListView.separated(
      itemBuilder: (context, index) => coinzListItem(index),
      separatorBuilder: (context, index) => SizedBox(
            height: AppHeightSize.sh10,
          ),
      itemCount: controller.count);

  Widget lodeMore(CoinzItemController controller) => RefreshIndicator(
        onRefresh: () => controller.refreshing(),
        child: LoadMore(
          isFinish: controller.count >= 60,
          onLoadMore: () => controller.loadMore(),
          child: listOfCoinzItem(controller),
          whenEmptyLoad: false,
          textBuilder: (status) {
            if (status == LoadMoreStatus.nomore)
              return AppString.endLoading;
            else
              return AppString.isLoading;
          },
        ),
      );
}
