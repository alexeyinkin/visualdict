import 'package:flutter/widgets.dart';

mixin CommentableControllerMixin on ChangeNotifier {
  final commentController = TextEditingController();
  bool _isCommentExpanded = false;

  bool get hasComment => commentController.text.trim().isNotEmpty;

  bool get isCommentExpanded => _isCommentExpanded;

  set isCommentExpanded(bool newValue) {
    _isCommentExpanded = newValue;
    notifyListeners();
  }
}
