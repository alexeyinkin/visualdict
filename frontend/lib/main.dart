import 'package:app_state/app_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';

import 'constants/locales.dart';
import 'controllers/settings.dart';
import 'init/data_source.dart';
import 'init/locator.dart';
import 'init/openai.dart';
import 'pages/home/screen.dart';
import 'pages/settings/page.dart';
import 'pages/words/page.dart';

// import 'pages/me/tabs/profile_tab_enum.dart';
// import 'pages/technologies/page.dart';
import 'router/page_factory.dart';
import 'router/route_information_parser.dart';
import 'router/router_delegate.dart';
import 'router/tab_enum.dart';
import 'theme/theme.dart';
import 'util/build_context.dart';
import 'util/element.dart';

final pageStacks = PageStacks();

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  initializeOpenAiBackend();
  await initializeDataSource();
  await initializeServiceLocator();

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

  runApp(const MyAppLocalizer());
}

class MyAppLocalizer extends StatelessWidget {
  const MyAppLocalizer();

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = GetIt.instance.get<SettingsNotifier>();

    return EasyLocalization(
      supportedLocales: Locales.all,
      path: 'assets/translations',
      // TODO: File easy_localization bug this breaks loading and forces en.
      // saveLocale: false,
      startLocale: settingsNotifier.locale,
      assetLoader: const YamlAssetLoader(),
      fallbackLocale: settingsNotifier.locale,
      child: AnimatedBuilder(
        animation: settingsNotifier,
        builder: (context, _) {
          (context as Element).markNeedsBuildDescendants();
          return MyApp();
        },
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routerDelegate = MyRouterDeleagate(
    pageStacks,
    HomeScreen(pageStacks: pageStacks),
  );

  final _routeInformationParser = MyRouteInformationParser();
  final _backButtonDispatcher = PageStacksBackButtonDispatcher(pageStacks);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      backButtonDispatcher: _backButtonDispatcher,
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
      theme: themeData,
      title: "Visual Dict",

      // Localization.
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
