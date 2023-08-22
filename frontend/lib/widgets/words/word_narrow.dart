import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import '../../theme/theme.dart';
import 'image_prompt.dart';
import 'word_image_or_not.dart';
import 'word_text_content.dart';

class WordNarrowWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordNarrowWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WordImageOrNotWidget(wordPublic),
        const MySpacing(),
        WordTextContentWidget(
          wordPublic,
          wordVisible: false,
        ),
        if (wordPublic.image?.prompt != null) ...[
          const MySpacing(),
          ImagePromptWidget(wordPublic.image!),
        ],
      ],
    );
  }
}
