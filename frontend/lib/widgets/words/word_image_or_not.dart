import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import 'no_image.dart';
import 'word_image.dart';

enum WordImageFontSizes {
  grid(15),
  large(50),
  ;

  final double size;

  const WordImageFontSizes(this.size);
}

class WordImageOrNotWidget extends StatelessWidget {
  final double fontSize;
  final WordPublic wordPublic;

  const WordImageOrNotWidget(
    this.wordPublic, {
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final image = wordPublic.image;
    return image == null
        ? NoImageWidget(
            fontSize: fontSize,
            title: wordPublic.id,
          )
        : WordImageWidget(
            wordPublic,
            fontSize: fontSize,
          );
  }
}
