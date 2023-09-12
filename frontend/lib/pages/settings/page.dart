import 'package:app_state/app_state.dart';
import 'package:flutter/foundation.dart';

import 'screen.dart';
import 'state.dart';

class SettingsPage extends StatefulMaterialPage<void, SettingsNotifier> {
  static const classFactoryKey = 'Settings';

  SettingsPage()
      : super(
          key: const ValueKey(classFactoryKey),
          factoryKey: classFactoryKey,
          state: SettingsNotifier(),
          createScreen: SettingsScreen.new,
        );

  // ignore: avoid_unused_constructor_parameters
  factory SettingsPage.fromState(Map<String, dynamic> state) => SettingsPage();
}
