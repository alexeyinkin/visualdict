import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../controllers/translation_map.dart';

class AddTranslationButton extends StatelessWidget {
  final TranslationMapEditingController controller;
  final String? lang;

  const AddTranslationButton({
    required this.controller,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return CollectionAddButtonBuilder(
      controller: controller,
      enabledBuilder: (_) => IconButton(
        onPressed: () {
          final mec = controller.add(
            lang,
            null,
          );
          mec.valueController.focusNode.requestFocus();
        },
        icon: lang == null ? const Icon(Icons.translate) : Text('+$lang'),
      ),
      isEnabled: lang == null ? null : () => !controller.keys.contains(lang),
    );
  }
}
