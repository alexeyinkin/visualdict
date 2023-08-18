import 'package:flutter/widgets.dart';

import '../../models/part_of_speech_enum.dart';

class PartOfSpeechWidget extends StatelessWidget {
  final PartOfSpeechEnum partOfSpeech;

  const PartOfSpeechWidget(this.partOfSpeech);

  @override
  Widget build(BuildContext context) {
    return Text(
      partOfSpeech.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
