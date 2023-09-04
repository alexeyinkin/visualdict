import 'package:flutter/material.dart';

import '../theme/my_theme_extension.dart';
import '../theme/theme.dart';

class EditorFrame extends StatelessWidget {
  final Widget child;

  const EditorFrame({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return MyPadding(
      child: ColoredBox(
        color: ext.nestingColor,
        child: child,
      ),
    );
  }
}
