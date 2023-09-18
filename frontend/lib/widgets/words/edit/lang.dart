import 'package:flutter/material.dart';

import '../../../controllers/lang.dart';

class LangEditWidget extends StatelessWidget {
  final LangEditingController controller;

  const LangEditWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textController,
      decoration: null,
    );
  }
}
