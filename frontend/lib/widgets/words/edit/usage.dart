import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';

import '../../../controllers/commentable.dart';
import '../../../controllers/is_visible.dart';
import '../../../theme/theme.dart';
import '../../buttons/comment.dart';
import '../../buttons/is_visible.dart';
import '../../layout/is_visible_frame.dart';
import 'comment_field.dart';

class UsageEditWidget extends StatelessWidget {
  final UsageEditingController controller;

  const UsageEditWidget(
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IsVisibleFrame(
          isVisible: controller.isVisible,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const MySpacing(),
                    const Text('💬'),
                    const MySpacing(),
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: controller.textController,
                            focusNode: controller.focusNode,
                            maxLines: null,
                          ),
                          CommentField(
                            controller: controller,
                            padding: MyPaddingEnum.top,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IsVisibleToggle(controller: controller),
                  CommentToggle(controller: controller),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

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
