import 'package:flutter/material.dart';

import '../../../helper/color_helper.dart';

/// start loading spinner
startLoading() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: ColorManager.white,
      strokeWidth: 5,
    ),
  );
}

/// stop loading spinner

class MyBuildCondition extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool? condition;

  /// Run if [condition] is true.
  final WidgetBuilder? builder;

  /// Run if [condition] is false and it is not null.
  Widget fallback =
      const Scaffold(body: Center(child: CircularProgressIndicator()));

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
