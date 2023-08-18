import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import 'no_image.dart';
import 'word_image.dart';

class WordImageOrNotWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordImageOrNotWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    final image = wordPublic.image;
    return image == null ? const NoImageWidget() : WordImageWidget(wordPublic);
  }
}
