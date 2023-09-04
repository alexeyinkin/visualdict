import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../../theme/my_theme_extension.dart';
import '../view/word_transcription.dart';
import 'part_of_speech_senses.dart';
import 'word_details.dart';

class WordTextContentEditWidget extends StatelessWidget {
  final WordPublicEditingController controller;
  final bool wordVisible;

  const WordTextContentEditWidget(
    this.controller, {
    required this.wordVisible,
  });

  @override
  Widget build(BuildContext context) {
    final wordPublic = controller.value;
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Column(
      children: [
        if (wordVisible) Text(wordPublic.id, style: ext.h2),
        Align(
          child: WordTranscriptionViewWidget(wordPublic),
        ),
        ReorderableListViewEditor(
          controller: controller.partOfSpeechSensesController,
          itemBuilder: (_, c, index) => PartOfSpeechSensesEditWidget(c),
          shrinkWrap: true,
        ),
        ListAddButtonBuilder(
          controller: controller.partOfSpeechSensesController,
        ),
      ],
    );
  }
}
