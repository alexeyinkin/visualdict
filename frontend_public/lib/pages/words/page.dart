import 'package:app_state/app_state.dart';
import 'package:flutter/foundation.dart';

import 'screen.dart';
import 'state.dart';

class WordsPage extends StatefulMaterialPage<void, WordsNotifier> {
  static const classFactoryKey = 'Words';

  WordsPage()
      : super(
          key: const ValueKey(classFactoryKey),
          factoryKey: classFactoryKey,
          state: WordsNotifier(),
          createScreen: WordsScreen.new,
        );

  // ignore: avoid_unused_constructor_parameters
  factory WordsPage.fromState(Map<String, dynamic> state) => WordsPage();
}
