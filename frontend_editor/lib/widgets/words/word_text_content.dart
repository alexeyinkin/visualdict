import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../controllers/word_public.dart';
import '../buttons/comment.dart';
import '../buttons/is_visible.dart';
import '../layout/is_visible_frame.dart';
import 'comment_field.dart';
import 'date.dart';
import 'part_of_speech_senses.dart';
import 'word_transcription.dart';

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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WordTranscriptionEditWidget(
                    controller.transcriptionController,
                  ),
                  const MySpacing(),
                  const MySpacing(),
                  const MySpacing(),
                  DateEditWidget(controller: controller.ofTheDayController),
                ],
              ),
              ReorderableListEditor(
                controller: controller.partOfSpeechSensesController,
                itemBuilder: (_, c, index) => PartOfSpeechSensesEditWidget(
                  c,
                  wordController: controller,
                ),
                shrinkWrap: true,
              ),
              CollectionAddButtonBuilder(
                controller: controller.partOfSpeechSensesController,
                enabledBuilder: (context) => DefaultAddButton(
                  onPressed: controller
                      .partOfSpeechSensesController.addNextPartOfSpeech,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
