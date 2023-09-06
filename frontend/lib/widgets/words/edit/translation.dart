import 'package:flutter/material.dart';

import '../../../controllers/translation.dart';
import '../../buttons/lock.dart';

class TranslationEditWidget extends StatelessWidget {
  final TranslationEditingController controller;

  const TranslationEditWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: controller.textController,
                maxLines: null,
              ),
            ),
            LockButton(
              isLocked: controller.isLocked,
              onChanged: (v) => controller.isLocked = v,
            ),
          ],
        );
      },
    );
  }
}
