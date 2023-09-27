import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

import 'commentable.dart';
import 'is_visible.dart';
import 'lang.dart';
import 'translation.dart';
import 'translation_map.dart';
import 'usage_list.dart';

class SenseEditingController extends ValueNotifier<Sense?>
    with CommentableControllerMixin, IsVisibleControllerMixin {
  bool _isAdvanced = false;
  final complexDefinitionController = TextEditingController();
  final definitionController = TextEditingController();

  final definitionTranslationsController = TranslationMapEditingController(
    createKeyController: LangEditingController.new,
    createValueController: TranslationEditingController.new,
    maxLength: 10000,
    isReorderable: false,
  );

  final usagesController = UsageListEditingController();

  SenseEditingController() : super(null) {
    commentController.addListener(notifyListeners);
  }

  bool get isAdvanced => _isAdvanced;

  set isAdvanced(bool newValue) {
    _isAdvanced = newValue;
    notifyListeners();
  }

  @override
  Sense? get value {
    final definition = definitionController.text.trim();
    if (definition.isEmpty) {
      return null;
    }

    return Sense(
      comment: commentController.text.trim(),
      complexDefinition: complexDefinitionController.text.trim(),
      definition: definition,
      definitionTranslations: definitionTranslationsController.nonNullValues,
      isVisible: isVisible,
      usages: usagesController.nonNullValues,
    );
  }

  @override
  set value(Sense? newValue) {
    commentController.text = newValue?.comment ?? '';
    complexDefinitionController.text = newValue?.complexDefinition ?? '';
    definitionController.text = newValue?.definition ?? '';
    definitionTranslationsController.value =
        newValue?.definitionTranslations ?? {};
    isVisible = newValue?.isVisible ?? true;
    usagesController.value = newValue?.usages ?? [];
    super.value = newValue;
  }
}
