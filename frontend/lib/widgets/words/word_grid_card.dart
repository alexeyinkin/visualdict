import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import 'word_image_or_not.dart';

class WordGridCard extends StatelessWidget {
  final WordPublic wordPublic;

  const WordGridCard(this.wordPublic);

  static const minSize = 100;

  @override
  Widget build(BuildContext context) {
    return WordImageOrNotWidget(
      wordPublic,
      fontSize: WordImageFontSizes.grid.size,
    );
  }
}
