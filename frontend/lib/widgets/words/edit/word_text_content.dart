import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../../theme/my_theme_extension.dart';
import '../../../theme/theme.dart';
import '../../buttons/comment.dart';
import '../../buttons/is_visible.dart';
import '../../layout/is_visible_frame.dart';
import '../view/word_transcription.dart';
import 'comment_field.dart';
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

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IsVisibleFrame(
          isVisible: controller.isVisible,
          child: Column(
            children: [
              if (wordVisible)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(wordPublic.id, style: ext.h2),
                    const MySpacing(),
                    IsVisibleToggle(controller: controller),
                    CommentToggle(controller: controller),
                  ],
                ),
              CommentField(
                controller: controller,
                padding: MyPaddingEnum.bottom,
              ),
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
          ),
        );
      },
    );
  }
}
