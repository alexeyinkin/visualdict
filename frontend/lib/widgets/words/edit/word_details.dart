import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

import '../../../controllers/commentable.dart';
import '../../../controllers/is_visible.dart';
import '../../../controllers/part_of_speech_senses_list.dart';
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
  final partOfSpeechSensesController =
      PartOfSpeechSensesListEditingController();
  final transcriptionController = TextEditingController();

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
      transcription: transcriptionController.text.trim(),
    );
  }

  @override
  set value(WordPublic newValue) {
    commentController.text = newValue.comment;
    isVisible = newValue.isVisible;
    partOfSpeechSensesController.value = newValue.partOfSpeechSenses;
    transcriptionController.text = newValue.transcription;
    super.value = newValue;
  }
}
