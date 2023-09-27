import 'package:flutter/widgets.dart';

import '../../theme/theme.dart';

class MyPadding extends StatelessWidget {
  final Widget child;
  final MyPaddingEnum padding;

  const MyPadding({
    super.key,
    required this.child,
    this.padding = MyPaddingEnum.all,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding.leftPx,
        right: padding.rightPx,
        top: padding.topPx,
        bottom: padding.bottomPx,
      ),
      child: child,
    );
  }
}

enum MyPaddingEnum {
  all(
    leftPx: AppStyle.padding,
    rightPx: AppStyle.padding,
    topPx: AppStyle.padding,
    bottomPx: AppStyle.padding,
  ),
  none(),
  bottom(bottomPx: AppStyle.padding),
  top(topPx: AppStyle.padding),
  ;

  final double topPx;
  final double bottomPx;
  final double leftPx;
  final double rightPx;

  const MyPaddingEnum({
    this.leftPx = 0,
    this.rightPx = 0,
    this.topPx = 0,
    this.bottomPx = 0,
  });
}
