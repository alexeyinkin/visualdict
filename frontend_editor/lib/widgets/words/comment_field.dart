import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';

import '../../controllers/commentable.dart';

class CommentField extends StatelessWidget {
  final CommentableControllerMixin controller;
  final MyPaddingEnum padding;

  const CommentField({
    required this.controller,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => Visibility(
        visible: controller.isCommentExpanded,
        child: MyPadding(
          padding: padding,
          child: TextField(
            controller: controller.commentController,
            decoration: const InputDecoration(
              labelText: "Comment",
            ),
            maxLines: null,
          ),
        ),
      ),
    );
  }
}
