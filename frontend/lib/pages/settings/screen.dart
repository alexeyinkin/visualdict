import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/theme.dart';
import '../../widgets/language/switch.dart';
import '../../widgets/layout/h2.dart';
import '../../widgets/my_scaffold.dart';
import 'state.dart';
import 'widgets/table.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsNotifier notifier;

  const SettingsScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      maxWidth: MySizes.maxTextPageWidth,
      scrolls: false,
      body: Column(
        children: [
          H2Widget(
            'SettingsScreen.title'.tr(),
          ),
          const MySpacing(),
          const SettingsTableWidget(
            children: {
              'language': LanguageSwitchWidget(showText: true),
            },
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
