import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/theme.dart';
import '../../widgets/layout/h2.dart';
import '../../widgets/my_scaffold.dart';
import 'state.dart';

class AboutScreen extends StatelessWidget {
  final AboutNotifier notifier;

  const AboutScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      maxWidth: MySizes.maxTextPageWidth,
      scrolls: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          H2Widget(
            'AboutScreen.title'.tr(),
          ),
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
