import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import 'commentable.dart';
import 'is_visible.dart';
import 'sense.dart';

class PartOfSpeechSensesEditingController
    extends ValueNotifier<PartOfSpeechSenses?>
    with CommentableControllerMixin, IsVisibleControllerMixin {
  PartOfSpeechEnum? _partOfSpeech;
  final sensesController = ListEditingController<Sense, SenseEditingController>(
    createItemController: SenseEditingController.new,
    maxLength: 100,
  );

  PartOfSpeechSensesEditingController() : super(null) {
    commentController.addListener(notifyListeners);
  }

  @override
  PartOfSpeechSenses? get value {
    if (_partOfSpeech == null) {
      return null;
    }

    return PartOfSpeechSenses(
      comment: commentController.text.trim(),
      isVisible: isVisible,
      partOfSpeech: _partOfSpeech!,
      senses: sensesController.nonNullValues,
    );
  }

  @override
  set value(PartOfSpeechSenses? newValue) {
    commentController.text = newValue?.comment ?? '';
    isVisible = newValue?.isVisible ?? true;
    _partOfSpeech = newValue?.partOfSpeech;
    sensesController.value = newValue?.senses ?? [];
    super.value = newValue;
  }

  PartOfSpeechEnum? get partOfSpeech => _partOfSpeech;

  set partOfSpeech(PartOfSpeechEnum? newValue) {
    _partOfSpeech = newValue;
    notifyListeners();
  }
}
