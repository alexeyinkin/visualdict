import 'package:flutter/material.dart';

import '../../../controllers/translation.dart';

class TranslationEditWidget extends StatelessWidget {
  final TranslationEditingController controller;

  const TranslationEditWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textController,
    );
  }
}
