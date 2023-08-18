import 'package:flutter/widgets.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xffdddddd),
      child: AspectRatio(
        aspectRatio: 1,
        child: Text("No Image"),
      ),
    );
  }
}
