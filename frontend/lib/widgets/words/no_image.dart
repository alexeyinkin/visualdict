import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xffdddddd),
      child: AspectRatio(
        aspectRatio: 1,
        child: const Text('NoImageWidget.text').tr(),
      ),
    );
  }
}
