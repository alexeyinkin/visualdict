import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../../controllers/usage_list.dart';
import '../../buttons/generate.dart';
import '../../layout/editor_frame.dart';
import 'part_of_speech_senses.dart';
import 'usage.dart';
import 'word_details.dart';
import 'word_sense.dart';

const _generateCounts = [1, 3, 10];

class UsagesEditWidget extends StatelessWidget {
  final WordPublicEditingController wordController;
  final PartOfSpeechSensesEditingController posController;
  final SenseEditingController senseController;
  final UsageListEditingController controller;

  const UsagesEditWidget(
    this.controller, {
    required this.wordController,
    required this.posController,
    required this.senseController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Column(
          children: [
            ReorderableListEditor(
              controller: controller,
              itemBuilder: (_, c, index) => EditorFrame(
                child: UsageEditWidget(c),
              ),
              shrinkWrap: true,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CollectionAddButtonBuilder(
                  controller: controller,
                  enabledBuilder: (_) => IconButton(
                    onPressed: () => controller.add(
                      null,
                    ),
                    icon: const Text('💬'),
                  ),
                ),
                for (final n in _generateCounts) ...[
                  const SizedBox(width: 20),
                  GenerateButton(
                    count: n,
                    isInProgress: controller.currentAction ==
                        controller.getGenerateActionName(n),
                    onPressed: controller.isGenerating ? null : _generate,
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _generate(int count) async {
    await controller.generate(
      word: wordController.id,
      pos: posController.partOfSpeech!,
      definition: senseController.definitionController.text.trim(),
      count: count,
    );
  }
}
