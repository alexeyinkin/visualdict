import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/widgets.dart';

import '../../controllers/image_prompt_generation.dart';
import '../../controllers/word_public.dart';
import '../images/image_generation.dart';
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
              ImageGenerationWidget(
                controller: ImagePromptGenerationController(),
                wordPublic: wordPublic,
              ),
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
          flex: 3,
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
