import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../constants/locales.dart';
import '../../controllers/settings.dart';
import 'flag.dart';
import 'line.dart';

class LanguageSwitchWidget extends StatelessWidget {
  final bool showText;

  const LanguageSwitchWidget({
    required this.showText,
  });

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = GetIt.instance.get<SettingsNotifier>();

    return AnimatedBuilder(
      animation: settingsNotifier,
      builder: (context, _) {
        return DropdownButton<Locale>(
          icon: const SizedBox(),
          items: [
            for (final locale in Locales.all)
              DropdownMenuItem(
                value: locale,
                child: LanguageLineWidget(locale: locale),
              ),
          ],
          onChanged: (locale) async => settingsNotifier.setLang(
            locale!.languageCode,
          ),
          selectedItemBuilder: (context) => [
            for (final locale in Locales.all)
              FlagWidget(
                locale,
                size: FlagWidgetSize.button,
              ),
          ],
          underline: const SizedBox(),
          value: settingsNotifier.locale,
        );
      },
    );
  }
}
