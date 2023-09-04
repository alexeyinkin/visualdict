import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import '../../../theme/theme.dart';
import '../../editor_frame.dart';
import '../part_of_speech.dart';
import 'word_sense.dart';

class PartOfSpeechSensesEditWidget extends StatelessWidget {
  final PartOfSpeechSensesEditingController controller;

  const PartOfSpeechSensesEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    final partOfSpeechSenses = controller.value;

    if (partOfSpeechSenses == null) {
      return Text("null");
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PartOfSpeechWidget(partOfSpeechSenses.partOfSpeech),
        const MySpacing(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: EditorFrame(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReorderableListViewEditor(
                  controller: controller.sensesController,
                  itemBuilder: (_, c, index) => EditorFrame(
                    child: WordSenseEditWidget(c, index: index),
                  ),
                  shrinkWrap: true,
                ),
                ListAddButtonBuilder(controller: controller.sensesController),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PartOfSpeechSensesEditingController
    extends ValueNotifier<PartOfSpeechSenses?> {
  final sensesController = ListEditingController<Sense, SenseEditingController>(
    createItemController: SenseEditingController.new,
    maxLength: 30,
  );

  PartOfSpeechSensesEditingController() : super(null);

  @override
  PartOfSpeechSenses? get value {
    final oldValue = super.value;

    if (oldValue == null) {
      // Cannot create because we have no PoS selector widget.
      // TODO: Allow creating new objects.
      // TODO: Create a selector widget for enums.
      return null;
    }

    return PartOfSpeechSenses(
      partOfSpeech: oldValue.partOfSpeech,
      senses: sensesController.nonNullValues,
    );
  }

  @override
  set value(PartOfSpeechSenses? newValue) {
    sensesController.value = newValue?.senses ?? [];
    super.value = newValue;
  }
}
