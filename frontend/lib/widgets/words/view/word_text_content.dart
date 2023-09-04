import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';

import '../../../theme/my_theme_extension.dart';
import 'part_of_speech_senses.dart';
import 'word_transcription.dart';

class WordTextContentViewWidget extends StatelessWidget {
  final WordPublic wordPublic;
  final bool wordVisible;

  const WordTextContentViewWidget(
    this.wordPublic, {
    required this.wordVisible,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Column(
      children: [
        if (wordVisible) Text(wordPublic.id, style: ext.h2),
        Align(
          child: WordTranscriptionViewWidget(wordPublic),
        ),
        for (final pos in wordPublic.partOfSpeechSenses)
          PartOfSpeechSensesViewWidget(pos, wordPublic: wordPublic),
      ],
    );
  }
}
