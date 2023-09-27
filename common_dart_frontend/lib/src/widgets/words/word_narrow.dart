import 'package:common_dart/common_dart.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/widgets.dart';

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
