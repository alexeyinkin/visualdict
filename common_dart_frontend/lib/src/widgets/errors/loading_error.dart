import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/my_theme_extension.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Center(
      child: Text('errors.loading', style: ext.cardTitle).tr(),
    );
  }
}
