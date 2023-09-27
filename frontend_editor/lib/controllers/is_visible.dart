import 'package:flutter/widgets.dart';

mixin IsVisibleControllerMixin on ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  set isVisible(bool newValue) {
    _isVisible = newValue;
    notifyListeners();
  }
}
