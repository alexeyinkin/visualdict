import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../controllers/part_of_speech_senses.dart';
import '../../controllers/sense.dart';
import '../../controllers/usage_list.dart';
import '../../controllers/word_public.dart';
import '../buttons/generate.dart';
import '../layout/editor_frame.dart';
import 'usage.dart';

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
              showDeleteThisAndAfterButtons: true,
              shrinkWrap: true,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CollectionAddButtonBuilder(
                  controller: controller,
                  enabledBuilder: (_) => IconButton(
                    onPressed: () {
                      final c = controller.add(null);
                      c.focusNode.requestFocus();
                    },
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

  Future<void> _generate({
    required int count,
    required String involving,
  }) async {
    await controller.generate(
      word: wordController.id,
      pos: posController.partOfSpeech!,
      definition: senseController.definitionController.text.trim(),
      count: count,
      involving: involving,
    );
  }
}
