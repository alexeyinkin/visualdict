import 'package:common_dart/common_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../theme/my_theme_extension.dart';
import '../../../theme/theme.dart';
import 'usage.dart';

class WordSenseViewWidget extends StatelessWidget {
  final int index;
  final Sense sense;
  final WordPublic wordPublic;

  const WordSenseViewWidget(
    this.sense, {
    required this.index,
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;
    final lang = context.locale.languageCode;

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
              _getDefinition(lang),
              const MySpacing(),
              for (final usage in sense.usages)
                if (usage.isVisible)
                  UsageViewWidget(
                    usage,
                    wordPublic: wordPublic,
                  ),
              const MySpacing(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getDefinition(String lang) {
    if (lang == LanguagesEnum.en.name) {
      return Text(sense.definition);
    }

    final translation = sense.definitionTranslations[lang]?.text;
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
