import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../../router/tab_enum.dart';
import 'page.dart';

class SettingsPath extends PagePath {
  static const _location = '/settings';

  const SettingsPath() : super(key: SettingsPage.classFactoryKey);

  @override
  String get location => _location;

  static SettingsPath? tryParse(RouteInformation ri) {
    if (ri.uri.path != _location) return null;

    return const SettingsPath();
  }

  @override
  String get defaultStackKey => TabEnum.settings.name;
}
