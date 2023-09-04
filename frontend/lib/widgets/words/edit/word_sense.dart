import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../../theme/my_theme_extension.dart';
import '../../../theme/theme.dart';
import '../../editor_frame.dart';
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

    return Row(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MySpacing(),
              TextField(
                controller: controller.complexDefinitionController,
                decoration: const InputDecoration(
                  labelText: "Unsimplified Definition",
                ),
                maxLines: null,
              ),
              const MySpacing(),
              TextField(
                controller: controller.definitionController,
                decoration: const InputDecoration(
                  labelText: "Definition",
                ),
                maxLines: null,
              ),
              const MySpacing(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "U:",
                    style: TextStyle(color: MyColors.minorLabel),
                  ),
                  const MySpacing(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ReorderableListViewEditor(
                          controller: controller.usagesController,
                          itemBuilder: (_, c, index) => EditorFrame(
                            child: UsageEditWidget(c),
                          ),
                          shrinkWrap: true,
                        ),
                        ListAddButtonBuilder(
                          controller: controller.usagesController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SenseEditingController extends ValueNotifier<Sense?> {
  final complexDefinitionController = TextEditingController();
  final definitionController = TextEditingController();
  final usagesController = ListEditingController<Usage, UsageEditingController>(
    createItemController: UsageEditingController.new,
    maxLength: 10,
  );

  SenseEditingController() : super(null);

  @override
  Sense? get value {
    final definition = definitionController.text;
    if (definition.isEmpty) {
      return null;
    }

    final oldValue = super.value;

    return Sense(
      comment: oldValue?.comment ?? '', // TODO
      complexDefinition: complexDefinitionController.text.isEmpty
          ? null
          : complexDefinitionController.text,
      definition: definition,
      definitionTranslations: {}, // TODO
      isVisible: oldValue?.isVisible ?? true, // TODO
      usages: usagesController.nonNullValues,
    );
  }

  @override
  set value(Sense? newValue) {
    complexDefinitionController.text = newValue?.complexDefinition ?? '';
    definitionController.text = newValue?.definition ?? '';
    usagesController.value = newValue?.usages ?? [];
    super.value = newValue;
  }
}
