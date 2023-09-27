import 'package:flutter/material.dart';

import 'small_icon.dart';

class CalendarButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CalendarButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SmallIconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.calendar_today),
    );
  }
}
