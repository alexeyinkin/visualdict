import 'package:flutter/widgets.dart';

class LangEditingController extends ValueNotifier<String?> {
  final textController = TextEditingController();

  LangEditingController() : super(null);

  @override
  String? get value {
    final text = textController.text.trim();

    if (text.isEmpty) {
      return null;
    }

    return text;
  }

  @override
  set value(String? newValue) {
    textController.text = newValue ?? '';
    notifyListeners();
  }
}
