import 'package:flutter/widgets.dart';

import '../../../models/word_public.dart';
import '../../../util/build_context.dart';
import 'word_narrow.dart';
import 'word_wide.dart';

class WordDetailsViewWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordDetailsViewWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileScreen();

    return isMobile
        ? WordNarrowViewWidget(wordPublic)
        : WordWideViewWidget(wordPublic);
  }
}
