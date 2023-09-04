import 'package:flutter/widgets.dart';

import '../../../theme/theme.dart';
import '../view/image_prompt.dart';
import '../word_image_or_not.dart';
import 'word_details.dart';
import 'word_text_content.dart';

class WordWideEditWidget extends StatelessWidget {
  final WordPublicEditingController controller;

  const WordWideEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    final wordPublic = controller.value;

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
          child: WordTextContentEditWidget(
            controller,
            wordVisible: true,
          ),
        ),
        const MySpacing(),
      ],
    );
  }
}
