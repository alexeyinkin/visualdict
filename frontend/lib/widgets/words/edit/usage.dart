import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';

class UsageEditWidget extends StatelessWidget {
  final UsageEditingController controller;

  const UsageEditWidget(
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.valueController,
    );
  }
}

class UsageEditingController extends ValueNotifier<Usage?> {
  final valueController = TextEditingController();

  UsageEditingController() : super(null);

  @override
  Usage? get value {
    final text = valueController.text.trim();

    if (text.isEmpty) {
      return null;
    }

    return Usage(
      text: text,
    );
  }

  @override
  set value(Usage? newValue) {
    valueController.text = newValue?.text ?? '';
    super.value = newValue;
  }
}
