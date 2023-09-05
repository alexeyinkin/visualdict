import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../../controllers/commentable.dart';
import '../../../controllers/is_visible.dart';
import '../../../controllers/lang.dart';
import '../../../controllers/translation.dart';
import '../../../theme/my_theme_extension.dart';
import '../../../theme/theme.dart';
import '../../buttons/comment.dart';
import '../../buttons/is_visible.dart';
import '../../buttons/settings.dart';
import '../../layout/editor_frame.dart';
import '../../layout/is_visible_frame.dart';
import 'comment_field.dart';
import 'translation_line.dart';
import 'usage.dart';

class WordSenseEditWidget extends StatelessWidget {
  final int index;
  final SenseEditingController controller;

  const WordSenseEditWidget(
    this.controller, {
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
                      itemBuilder: (_, c, index) => EditorFrame(
                        child: TranslationLineEditWidget(c),
                      ),
                      shrinkWrap: true,
                    ),
                    MapAddButtonBuilder(
                      controller: controller.definitionTranslationsController,
                      enabledBuilder: (_) => IconButton(
                        onPressed: () =>
                            controller.definitionTranslationsController.add(
                          '',
                          null,
                        ),
                        icon: const Icon(Icons.translate),
                      ),
                    ),
                    const MySpacing(),
                    ReorderableListEditor(
                      controller: controller.usagesController,
                      itemBuilder: (_, c, index) => EditorFrame(
                        child: UsageEditWidget(c),
                      ),
                      shrinkWrap: true,
                    ),
                    ListAddButtonBuilder(
                      controller: controller.usagesController,
                      enabledBuilder: (_) => IconButton(
                        onPressed: () => controller.usagesController.add(
                          null,
                        ),
                        icon: const Text('💬'),
                      ),
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

class SenseEditingController extends ValueNotifier<Sense?>
    with CommentableControllerMixin, IsVisibleControllerMixin {
  bool _isAdvanced = false;
  final complexDefinitionController = TextEditingController();
  final definitionController = TextEditingController();
  final definitionTranslationsController = MapEditingController<String,
      LangEditingController, Translation, TranslationEditingController>(
    createKeyController: LangEditingController.new,
    createValueController: TranslationEditingController.new,
    maxLength: 10000,
    isReorderable: false,
  );
  final usagesController = ListEditingController<Usage, UsageEditingController>(
    createItemController: UsageEditingController.new,
    maxLength: 10,
  );

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
