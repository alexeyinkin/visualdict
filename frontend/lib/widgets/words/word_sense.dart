import 'package:common_dart/common_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/languages.dart';
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
              _getDefinition(),
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

  Widget _getDefinition() {
    if (lang == Languages.en.name) {
      return Text(sense.definition);
    }

    final translation = sense.definitionTranslations[lang]?.value;
    if (translation != null) {
      return Text(translation);
    }

    return Text(
      sense.definition + ' (' + 'common.noTranslation'.tr() + ')',
      style: const TextStyle(
        color: Color(0xff800000),
      ),
    );
  }
}
