import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../controllers/app_delegate.dart';
import 'state.dart' as s;
import 'widgets/table.dart';

class SettingsScreen extends StatelessWidget {
  final s.SettingsNotifier notifier;

  const SettingsScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      delegate: appDelegate,
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
