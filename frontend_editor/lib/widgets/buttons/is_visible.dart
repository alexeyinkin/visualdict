import 'package:flutter/material.dart';

import '../../controllers/is_visible.dart';
import 'small_icon.dart';

class IsVisibleToggle extends StatelessWidget {
  final IsVisibleControllerMixin controller;

  const IsVisibleToggle({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return SmallIconButton(
          onPressed: () => controller.isVisible = !controller.isVisible,
          icon: Icon(
            controller.isVisible ? Icons.visibility : Icons.visibility_off,
          ),
        );
      },
    );
  }
}
