import 'package:app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

import 'path.dart';

class SettingsNotifier extends ChangeNotifier with PageStateMixin<void> {
  @override
  SettingsPath get path => const SettingsPath();
}
