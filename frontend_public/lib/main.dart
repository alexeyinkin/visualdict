import 'package:app_state/app_state.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_multi/easy_localization_multi.dart';
import 'package:easy_localization_yaml/easy_localization_yaml.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';

import 'init/firebase.dart';
import 'init/locator.dart';
import 'init/router.dart';
import 'init/update_detector.dart';
import 'pages/home/screen.dart';
import 'router/page_stacks.dart';
import 'router/route_information_parser.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initializeFirebase();
  await initializeServiceLocator();
  initializeUpdateDetector();
  initializeRouter();

  runApp(const MyAppLocalizer());
}

class MyAppLocalizer extends StatelessWidget {
  const MyAppLocalizer();

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = GetIt.instance.get<SettingsNotifier>();

    return EasyLocalization(
      supportedLocales: Locales.all,
      path: 'unused',
      // TODO: File easy_localization bug this breaks loading and forces en.
      // saveLocale: false,
      startLocale: settingsNotifier.locale,
      assetLoader: const MultiAssetLoader([
          YamlAssetLoader(directory: 'assets/translations'),
          CommonDartFrontend.easyLocalizationLoader,
        ],
      ),
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
  final _routerDelegate = MyRouterDelegate(
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
