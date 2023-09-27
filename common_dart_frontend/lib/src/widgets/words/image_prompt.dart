import 'package:common_dart/common_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart' hide Image;
import 'package:flutter_markdown/flutter_markdown.dart';

class ImagePromptViewWidget extends StatelessWidget {
  final Image image;

  const ImagePromptViewWidget(this.image);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: 'ImagePromptWidget.midjourneyMd'.tr(
        namedArgs: {'prompt': image.prompt ?? ''},
      ),
      physics: const NeverScrollableScrollPhysics(),
      selectable: true,
      shrinkWrap: true,
    );
  }
}
