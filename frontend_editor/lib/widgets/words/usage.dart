import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';

import '../../controllers/usage.dart';
import '../buttons/comment.dart';
import '../buttons/is_visible.dart';
import '../layout/is_visible_frame.dart';
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
