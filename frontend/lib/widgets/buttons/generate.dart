import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../input_dialog.dart';
import '../layout/greyscale.dart';
import '../loading/small_circular_progress_indicator.dart';
import 'small_icon.dart';

class GenerateButton extends StatelessWidget {
  final int count;
  final bool isInProgress;
  final void Function({required int count, required String involving})? onPressed;

  const GenerateButton({
    required this.count,
    required this.isInProgress,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = SmallIconButton(
      onPressed: _isEnabled ? () async => _onPressed(context) : null,
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

  Future<void> _onPressed(BuildContext context) async {
    if (!RawKeyboard.instance.keysPressed
        .contains(LogicalKeyboardKey.controlLeft)) {
      onPressed!(count: count, involving: '');
      return;
    }

    final involving = await InputDialog.show(
      context: context,
      title: "Generate Usages Involving:",
    );

    if (involving != null) {
      onPressed!(count: count, involving: involving);
    }
  }
}
