import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

import 'commentable.dart';
import 'is_visible.dart';

class UsageEditingController extends ValueNotifier<Usage?>
    with CommentableControllerMixin, IsVisibleControllerMixin {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  UsageEditingController() : super(null) {
    commentController.addListener(notifyListeners);
  }

  @override
  Usage? get value {
    final text = textController.text.trim();

    if (text.isEmpty) {
      return null;
    }

    return Usage(
      comment: commentController.text.trim(),
      isVisible: isVisible,
      text: text,
    );
  }

  @override
  set value(Usage? newValue) {
    commentController.text = newValue?.comment ?? '';
    isVisible = newValue?.isVisible ?? true;
    textController.text = newValue?.text ?? '';
    super.value = newValue;
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
