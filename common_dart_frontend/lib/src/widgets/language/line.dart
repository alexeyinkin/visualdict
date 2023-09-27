import 'package:flutter/widgets.dart';

import '../layout/my_spacing.dart';
import 'flag.dart';
import 'title.dart';

class LanguageLineWidget extends StatelessWidget {
  final Locale locale;

  const LanguageLineWidget({
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlagWidget(
          locale,
          size: FlagWidgetSize.list,
        ),
        const MySpacing(),
        LanguageTitleWidget(locale: locale),
      ],
    );
  }
}
