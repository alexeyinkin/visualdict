import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoImageWidget extends StatelessWidget {
  final double fontSize;

  const NoImageWidget({
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xffdddddd),
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: ColoredBox(
              color: const Color(0xffaaaaaa),
              child: Text(
                  'NoImageWidget.text',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
            ),
          ),
        ),
      ),
    );
  }
}
