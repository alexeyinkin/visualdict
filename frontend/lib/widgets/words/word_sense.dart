import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/languages.dart';
import '../../models/sense.dart';
import '../../models/word_public.dart';
import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import 'usage.dart';

class WordSenseWidget extends StatelessWidget {
  final int index;
  final Sense sense;
  final WordPublic wordPublic;

  const WordSenseWidget(
    this.sense, {
    required this.index,
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    //return Container(width: 100, height: 100, color: Color(0xff8080f0));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${index + 1}',
              style: ext.h2,
            ),
          ),
        ),
        const MySpacing(),
        const MySpacing(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sense.definitionTranslations[lang] ?? ''),
              const MySpacing(),
              for (final usage in sense.usages)
                UsageWidget(
                  usage,
                  wordPublic: wordPublic,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
