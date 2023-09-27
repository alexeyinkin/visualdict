import 'package:app_state/app_state.dart';

import '../pages/settings/page.dart';
import '../pages/words/page.dart';
import '../router/page_factory.dart';
import '../router/page_stacks.dart';
import '../router/tab_enum.dart';

void initializeRouter() {
  pageStacks.addPageStack(
    TabEnum.words.name,
    PageStack(
      bottomPage: WordsPage(),
      createPage: PageFactory.createPage,
    ),
  );

  pageStacks.addPageStack(
    TabEnum.settings.name,
    PageStack(
      bottomPage: SettingsPage(),
      createPage: PageFactory.createPage,
    ),
  );
}
