import 'package:flutter/material.dart';

import 'small_icon.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SmallIconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.settings),
    );
  }
}
