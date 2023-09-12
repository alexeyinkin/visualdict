import 'package:flutter/widgets.dart';

import '../../../theme/theme.dart';
import '../../../util/iterable.dart';
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
