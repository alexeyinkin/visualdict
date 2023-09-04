import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/link.dart';

import '../../pages/word/path.dart';
import '../clickable.dart';
import 'word_image_or_not.dart';

class WordGridCard extends StatelessWidget {
  final WordPublic wordPublic;

  const WordGridCard(this.wordPublic);

  static const minSize = 100;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: WordPath(id: wordPublic.id).uri,
      builder: (_, launch) {
        return ClickableWidget(
          onTap: launch,
          child: WordImageOrNotWidget(
            wordPublic,
            fontSize: WordImageFontSizes.grid.size,
          ),
        );
      }
    );
  }
}
