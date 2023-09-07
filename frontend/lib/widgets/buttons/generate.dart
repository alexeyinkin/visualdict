import 'package:flutter/material.dart';

import '../layout/greyscale.dart';
import '../loading/small_circular_progress_indicator.dart';
import 'small_icon.dart';

class GenerateButton extends StatelessWidget {
  final int count;
  final bool isInProgress;
  final void Function(int)? onPressed;

  const GenerateButton({
    required this.count,
    required this.isInProgress,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = SmallIconButton(
      onPressed: _isEnabled ? () => onPressed!(count) : null,
      icon: count == 1 ? const Text('🪄') : Text('$count🪄'),
    );

    if (isInProgress) {
      widget = Stack(
        children: [
          widget,
          const Positioned.fill(
            child: SmallCircularProgressIndicator(size: 20),
          ),
        ],
      );
    }

    return _isEnabled ? widget : GreyscaleWidget(child: widget);
  }

  bool get _isEnabled => onPressed != null;
}
