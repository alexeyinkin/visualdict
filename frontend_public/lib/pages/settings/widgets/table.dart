import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/widgets.dart';

import 'line.dart';

class SettingsTableWidget extends StatelessWidget {
  final Map<String, Widget> children;

  const SettingsTableWidget({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final entry in children.entries)
          SettingsLineWidget(
            textKey: entry.key,
            child: entry.value,
          ),
      ].alternateWith(const MySpacing()).toList(growable: false),
    );
  }
}
