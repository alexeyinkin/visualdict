import 'package:flutter/material.dart';

import 'small_icon.dart';

class LockButton extends StatelessWidget {
  final bool isLocked;
  final ValueChanged<bool> onChanged;

  const LockButton({
    required this.isLocked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SmallIconButton(
      onPressed: () => onChanged(!isLocked),
      icon: Icon(
        isLocked ? Icons.lock : Icons.lock_open,
        // size: 16,
      ),
    );
  }
}
