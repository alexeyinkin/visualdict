import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

class TranslationEditingController extends ValueNotifier<Translation?> {
  bool _isLocked = false;
  final textController = TextEditingController();

  TranslationEditingController() : super(null);

  bool get isLocked => _isLocked;

  set isLocked(bool newValue) {
    _isLocked = newValue;
    notifyListeners();
  }

  @override
  Translation? get value {
    final text = textController.text.trim();

    if (text.isEmpty) {
      return null;
    }

    return Translation(
      isLocked: _isLocked,
      text: text,
    );
  }

  @override
  set value(Translation? newValue) {
    _isLocked = newValue?.isLocked ?? false;
    textController.text = newValue?.text ?? '';
  }
}
