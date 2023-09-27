import 'package:flutter/material.dart';

import '../../controllers/commentable.dart';
import 'small_icon.dart';

class CommentToggle extends StatelessWidget {
  final CommentableControllerMixin controller;

  const CommentToggle({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Opacity(
          opacity: controller.hasComment ? 1 : .5,
          child: SmallIconButton(
            icon: const Icon(Icons.comment),
            onPressed: () =>
                controller.isCommentExpanded = !controller.isCommentExpanded,
          ),
        );
      },
    );
  }
}
