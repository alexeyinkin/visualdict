import 'package:flutter/material.dart';

import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import 'is_visible_frame.dart';

class EditorFrame extends StatelessWidget {
  final Widget child;
  final bool isVisible;

  const EditorFrame({
    required this.child,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return IsVisibleFrame(
      isVisible: isVisible,
      child: MyPadding(
        child: ColoredBox(
          color: ext.nestingColor,
          child: child,
        ),
      ),
    );
  }
}
