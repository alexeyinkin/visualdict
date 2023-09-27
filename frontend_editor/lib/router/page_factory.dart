import 'package:app_state/app_state.dart';

import '../pages/word/page.dart';
import '../pages/words/page.dart';

class PageFactory {
  static AbstractPage? createPage(
    String factoryKey,
    Map<String, dynamic> state,
  ) {
    switch (factoryKey) {
      case WordsPage.classFactoryKey:
        return WordsPage.fromState(state);

      case WordPage.classFactoryKey:
        return WordPage.fromState(state);
    }

    return null;
  }
}
