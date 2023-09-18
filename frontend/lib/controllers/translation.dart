import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

class TranslationEditingController extends ValueNotifier<Translation?> {
  bool _isLocked = false;
  bool _savedIsLocked = false;
  String _savedText = '';
  final textController = TextEditingController();
  final focusNode = FocusNode();

  TranslationEditingController() : super(null) {
    textController.addListener(_onTextControllerChange);
  }

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
    _savedIsLocked = newValue?.isLocked ?? false;
    _isLocked = _savedIsLocked;

    _savedText = newValue?.text ?? '';
    textController.text = _savedText;
  }

  void _onTextControllerChange() {
    final text = textController.text;

    if (text == _savedText) {
      _isLocked = _savedIsLocked;
    } else {
      _isLocked = true;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
