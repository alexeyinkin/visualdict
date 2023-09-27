import 'package:flutter/widgets.dart';

class IsVisibleFrame extends StatelessWidget {
  final Widget child;
  final bool isVisible;

  const IsVisibleFrame({
    required this.child,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isVisible ? 1 : .5,
      child: child,
    );
  }
}
