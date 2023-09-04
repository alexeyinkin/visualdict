import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import 'part_of_speech_senses.dart';
import 'word_wide.dart';

class WordDetailsEditWidget extends StatelessWidget {
  final WordPublicEditingController controller;

  const WordDetailsEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return WordWideEditWidget(controller);
  }
}

class WordPublicEditingController extends ValueNotifier<WordPublic> {
  final partOfSpeechSensesController = ListEditingController<PartOfSpeechSenses,
      PartOfSpeechSensesEditingController>(
    minLength: 1,
    maxLength: 10,
    createItemController: PartOfSpeechSensesEditingController.new,
  );

  WordPublicEditingController(super._value);

  @override
  set value(WordPublic newValue) {
    partOfSpeechSensesController.value = newValue.partOfSpeechSenses;
    super.value = newValue;
  }

  @override
  WordPublic get value {
    final oldValue = super.value;

    return WordPublic(
      comment: oldValue.comment, // TODO
      id: oldValue.id,
      image: oldValue.image,
      isVisible: oldValue.isVisible, // TODO
      partOfSpeechSenses: partOfSpeechSensesController.nonNullValues,
      pronunciation: oldValue.pronunciation,
      transcription: oldValue.transcription,
    );
  }
}
