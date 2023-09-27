import 'package:flutter/widgets.dart';

import '../../controllers/word_public.dart';
import 'word_wide.dart';

class WordDetailsEditWidget extends StatelessWidget {
  final WordPublicEditingController controller;

  const WordDetailsEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return WordWideEditWidget(controller);
  }
}
