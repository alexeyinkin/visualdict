import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/word_public.dart';
import '../../theme/my_theme_extension.dart';

class WordImageWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordImageWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Stack(
      children: [
        CachedNetworkImage(imageUrl: wordPublic.image!.url.toString()),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ColoredBox(
            color: Color(0x80000000),
            child: Align(
              child: Text(
                wordPublic.id,
                style: ext.h1,
                //style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
