import 'package:flutter/material.dart';

import '../theme/my_theme_extension.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;
    return Text("Visual Dict", style: ext.h1);
  }
}
