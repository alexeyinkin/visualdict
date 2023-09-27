import 'package:common_dart/common_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../layout/my_spacing.dart';
import 'image_prompt.dart';
import 'word_image_or_not.dart';
import 'word_text_content.dart';

class WordWideViewWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordWideViewWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MySpacing(),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WordImageOrNotWidget(
                wordPublic,
                fontSize: WordImageFontSizes.large.size,
              ),
              if (wordPublic.image?.prompt != null) ...[
                const MySpacing(),
                ImagePromptViewWidget(wordPublic.image!),
              ],
            ],
          ),
        ),
        const MySpacing(),
        Expanded(
          flex: kIsWeb ? 1 : 2,
          child: WordTextContentViewWidget(
            wordPublic,
            wordVisible: true,
          ),
        ),
        const MySpacing(),
      ],
    );
  }
}
