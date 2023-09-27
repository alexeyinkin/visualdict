import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

import '../layout/my_spacing.dart';
import 'part_of_speech.dart';
import 'word_sense.dart';

class PartOfSpeechSensesViewWidget extends StatelessWidget {
  final PartOfSpeechSenses partOfSpeechSenses;
  final WordPublic wordPublic;

  const PartOfSpeechSensesViewWidget(
    this.partOfSpeechSenses, {
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    final visibleSenses = partOfSpeechSenses.senses
        .where((s) => s.isVisible)
        .toList(growable: false);

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
              return WordSenseViewWidget(
                visibleSenses[index],
                index: index,
                wordPublic: wordPublic,
              );
            },
            itemCount: visibleSenses.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
