import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import '../../theme/theme.dart';
import 'image_prompt.dart';
import 'word_image_or_not.dart';
import 'word_text_content.dart';

class WordWideWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordWideWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MySpacing(),
        Expanded(
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WordImageOrNotWidget(wordPublic),
              if (wordPublic.image?.prompt != null) ...[
                const MySpacing(),
                ImagePromptWidget(wordPublic.image!),
              ],
            ],
          ),
        ),
        const MySpacing(),
        Expanded(child: WordTextContentWidget(wordPublic)),
        const MySpacing(),
      ],
    );
  }
}
