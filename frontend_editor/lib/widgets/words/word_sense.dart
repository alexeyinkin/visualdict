import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../controllers/part_of_speech_senses.dart';
import '../../controllers/sense.dart';
import '../../controllers/word_public.dart';
import '../buttons/comment.dart';
import '../buttons/is_visible.dart';
import '../buttons/settings.dart';
import '../layout/is_visible_frame.dart';
import 'add_translation_button.dart';
import 'comment_field.dart';
import 'translation_line.dart';
import 'usages.dart';

class WordSenseEditWidget extends StatelessWidget {
  final int index;
  final WordPublicEditingController wordController;
  final PartOfSpeechSensesEditingController posController;
  final SenseEditingController controller;

  const WordSenseEditWidget(
    this.controller, {
    required this.wordController,
    required this.posController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IsVisibleFrame(
          isVisible: controller.isVisible,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${index + 1}',
                    style: ext.h2,
                  ),
                ),
              ),
              const MySpacing(),
              const MySpacing(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.isAdvanced) ...[
                      const MySpacing(),
                      TextField(
                        controller: controller.complexDefinitionController,
                        decoration: const InputDecoration(
                          labelText: "Unsimplified Definition",
                        ),
                        maxLines: null,
                      ),
                    ],
                    const MySpacing(),
                    TextField(
                      controller: controller.definitionController,
                      decoration: controller.isAdvanced
                          ? const InputDecoration(
                              labelText: "Definition",
                            )
                          : const InputDecoration(),
                      maxLines: null,
                    ),
                    const MySpacing(),
                    CommentField(
                      controller: controller,
                      padding: MyPaddingEnum.bottom,
                    ),
                    ReorderableMapEditor(
                      controller: controller.definitionTranslationsController,
                      itemBuilder: (_, c, index) =>
                          TranslationLineEditWidget(c),
                      shrinkWrap: true,
                    ),
                    AddTranslationButton(
                      controller: controller.definitionTranslationsController,
                      lang: 'ru',
                    ),
                    const MySpacing(),
                    UsagesEditWidget(
                      controller.usagesController,
                      wordController: wordController,
                      posController: posController,
                      senseController: controller,
                    ),
                  ],
                ),
              ),
              const MySpacing(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IsVisibleToggle(controller: controller),
                  SettingsButton(
                    onPressed: () =>
                        controller.isAdvanced = !controller.isAdvanced,
                  ),
                  CommentToggle(controller: controller),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
