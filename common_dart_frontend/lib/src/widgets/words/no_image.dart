import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../package.dart';

class NoImageWidget extends StatelessWidget {
  final double fontSize;
  final String? title;

  const NoImageWidget({
    required this.fontSize,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color(0xffdddddd),
          child: AspectRatio(
            aspectRatio: 1,
            child: Opacity(
              opacity: .1,
              child: SvgPicture.asset(
                'assets/images/no-image.svg',
                package: CommonDartFrontend.packageName,
              ),
            ),
          ),
        ),
        if (title != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ColoredBox(
              color: const Color(0x80000000),
              child: Align(
                child: Text(
                  title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
