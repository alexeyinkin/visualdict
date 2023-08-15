import 'package:flutter/material.dart';

import '../../theme/my_theme_extension.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Center(
      child: Text("Loading error", style: ext.cardTitle),
    );
  }
}
