import 'package:flutter/material.dart';

class SmallIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const SmallIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
      onPressed: onPressed,
      icon: icon,
      iconSize: 16,
    );
  }
}
