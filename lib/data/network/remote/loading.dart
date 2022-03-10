import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../constant/color_manger.dart';

/// start loading spinner
startLoading() {
  SmartDialog.showLoading(
   
    background: ColorManager.white,
    widget: const CircularProgressIndicator(
      strokeWidth: 5,
      valueColor: AlwaysStoppedAnimation(Colors.orange),
    ),
   
  );
}

/// stop loading spinner
dismissLoading() {
  SmartDialog.dismiss();
}

class MyBuildCondition extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool? condition;

  /// Run if [condition] is true.
  final WidgetBuilder? builder;

  /// Run if [condition] is false and it is not null.
  Widget fallback = const Center(
    child: CircularProgressIndicator(),
  );

  MyBuildCondition({
    Key? key,
    this.condition,
    this.builder,
  })  : assert(condition != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      condition != null && condition == true ? builder!(context) : fallback;
}
