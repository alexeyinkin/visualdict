import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';

class WordImageWidget extends StatelessWidget {
  final double fontSize;
  final WordPublic wordPublic;

  const WordImageWidget(
    this.wordPublic, {
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO: show local images.
        CachedNetworkImage(
          imageUrl: wordPublic.image!.getFullUrl(wordPublic.id).toString(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ColoredBox(
            color: Color(0x80000000),
            child: Align(
              child: Text(
                wordPublic.id,
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
