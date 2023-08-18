import 'package:flutter/widgets.dart' hide Image;
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../models/image.dart';

class ImagePromptWidget extends StatelessWidget {
  final Image image;

  const ImagePromptWidget(this.image);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: "**Midjourney Prompt:** *${image.prompt}*",
      selectable: true,
      shrinkWrap: true,
    );
  }
}
