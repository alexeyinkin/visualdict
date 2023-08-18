import 'package:flutter/widgets.dart';
import 'package:visualdict/widgets/words/word_sense.dart';

import '../../models/part_of_speech_senses.dart';
import '../../models/word_public.dart';
import '../../theme/theme.dart';
import 'part_of_speech.dart';

class PartOfSpeechSensesWidget extends StatelessWidget {
  final PartOfSpeechSenses partOfSpeechSenses;
  final WordPublic wordPublic;

  const PartOfSpeechSensesWidget(
    this.partOfSpeechSenses, {
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PartOfSpeechWidget(partOfSpeechSenses.partOfSpeech),
        const MySpacing(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return WordSenseWidget(
                partOfSpeechSenses.senses[index],
                index: index,
                wordPublic: wordPublic,
              );
            },
            itemCount: partOfSpeechSenses.senses.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
