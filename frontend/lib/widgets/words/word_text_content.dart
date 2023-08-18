import 'package:flutter/material.dart';
import 'package:visualdict/widgets/words/part_of_speech_senses.dart';

import '../../models/word_public.dart';
import '../../theme/my_theme_extension.dart';
import 'word_sense.dart';
import 'word_transcription.dart';

class WordTextContentWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordTextContentWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Column(
      children: [
        Text(wordPublic.id, style: ext.h2),
        Align(
          child: WordTranscriptionWidget(wordPublic),
        ),
        for (final pos in wordPublic.partOfSpeechSenses)
          PartOfSpeechSensesWidget(pos, wordPublic: wordPublic),
      ],
    );
  }
}
