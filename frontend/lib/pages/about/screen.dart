import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import '../../widgets/my_scaffold.dart';
import 'state.dart';

class AboutScreen extends StatelessWidget {
  final AboutNotifier notifier;

  const AboutScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>();

    return MyScaffold(
      maxWidth: MySizes.maxPageWidth,
      scrolls: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'AboutScreen.title',
            style: ext?.h2,
            textAlign: TextAlign.center,
          ).tr(),
          const MySpacing(),
          Flexible(
            child: const Text(
              'AboutScreen.text',
              textAlign: TextAlign.center,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
