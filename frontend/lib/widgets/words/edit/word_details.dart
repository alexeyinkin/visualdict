import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import '../../../controllers/commentable.dart';
import '../../../controllers/is_visible.dart';
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

class WordPublicEditingController extends ValueNotifier<WordPublic>
    with CommentableControllerMixin, IsVisibleControllerMixin {
  final partOfSpeechSensesController = ListEditingController<PartOfSpeechSenses,
      PartOfSpeechSensesEditingController>(
    minLength: 1,
    maxLength: 10,
    createItemController: PartOfSpeechSensesEditingController.new,
  );

  WordPublicEditingController(super._value) {
    commentController.addListener(notifyListeners);
  }

  @override
  WordPublic get value {
    final oldValue = super.value;

    return WordPublic(
      comment: commentController.text,
      id: oldValue.id,
      image: oldValue.image,
      isVisible: isVisible,
      partOfSpeechSenses: partOfSpeechSensesController.nonNullValues,
      pronunciation: oldValue.pronunciation,
      transcription: oldValue.transcription,
    );
  }

  @override
  set value(WordPublic newValue) {
    commentController.text = newValue.comment;
    isVisible = newValue.isVisible;
    partOfSpeechSensesController.value = newValue.partOfSpeechSenses;
    super.value = newValue;
  }
}
