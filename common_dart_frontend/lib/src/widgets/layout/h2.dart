import 'package:flutter/material.dart';

import '../../theme/my_theme_extension.dart';

class H2Widget extends StatelessWidget {
  final String text;

  const H2Widget(this.text);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>();

    return Text(
      text,
      style: ext?.h2,
      textAlign: TextAlign.center,
    );
  }
}
