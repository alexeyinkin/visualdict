import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

import '../../../theme/theme.dart';
import '../word_image_or_not.dart';
import 'image_prompt.dart';
import 'word_text_content.dart';

class WordNarrowViewWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordNarrowViewWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WordImageOrNotWidget(
          wordPublic,
          fontSize: WordImageFontSizes.large.size,
        ),
        const MySpacing(),
        WordTextContentViewWidget(
          wordPublic,
          wordVisible: false,
        ),
        if (wordPublic.image?.prompt != null) ...[
          const MySpacing(),
          ImagePromptViewWidget(wordPublic.image!),
        ],
      ],
    );
  }
}
