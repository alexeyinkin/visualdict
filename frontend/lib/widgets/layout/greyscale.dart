import 'package:flutter/material.dart';

class GreyscaleWidget extends StatelessWidget {
  final Widget child;

  const GreyscaleWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: const BoxDecoration(
        color: Colors.grey,
        backgroundBlendMode: BlendMode.saturation,
      ),
      child: child,
    );
  }
}
