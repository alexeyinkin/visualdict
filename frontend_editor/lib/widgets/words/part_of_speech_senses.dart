import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import '../../controllers/part_of_speech_senses.dart';
import '../../controllers/word_public.dart';
import '../buttons/comment.dart';
import '../buttons/is_visible.dart';
import '../layout/editor_frame.dart';
import '../layout/is_visible_frame.dart';
import 'comment_field.dart';
import 'part_of_speech_dropdown.dart';
import 'word_sense.dart';

class PartOfSpeechSensesEditWidget extends StatelessWidget {
  final WordPublicEditingController wordController;
  final PartOfSpeechSensesEditingController controller;

  const PartOfSpeechSensesEditWidget(
    this.controller, {
    required this.wordController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IsVisibleFrame(
          isVisible: controller.isVisible,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PartOfSpeechDropdown(
                    value: controller.partOfSpeech,
                    onChanged: (v) => controller.partOfSpeech = v,
                  ),
                  const MySpacing(),
                  IsVisibleToggle(controller: controller),
                  CommentToggle(controller: controller),
                ],
              ),
              CommentField(
                controller: controller,
                padding: MyPaddingEnum.top,
              ),
              const MySpacing(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: EditorFrame(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReorderableListEditor(
                        controller: controller.sensesController,
                        itemBuilder: (_, c, index) => EditorFrame(
                          child: WordSenseEditWidget(
                            c,
                            wordController: wordController,
                            posController: controller,
                            index: index,
                          ),
                        ),
                        showDeleteThisAndAfterButtons: true,
                        shrinkWrap: true,
                      ),
                      CollectionAddButtonBuilder(
                        controller: controller.sensesController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
