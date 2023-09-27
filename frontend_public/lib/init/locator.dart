import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:get_it/get_it.dart';

import '../loader_factories/global_firestore.dart';
import '../loader_factories/word_public_firestore.dart';

Future<void> initializeServiceLocator() async {
  _initializeLoaderFactories();
  await _initializeServices();
}

void _initializeLoaderFactories() {
  GetIt.instance.registerSingleton(GlobalFirestoreLoaderFactory());
  GetIt.instance.registerSingleton<WordPublicLoaderFactory>(
    WordPublicFirestoreLoaderFactory(),
  );
}

Future<void> _initializeServices() async {
  // GetIt.instance.registerSingleton(AuthenticationCubit());
  GetIt.instance.registerSingleton(ToastNotifier());

  final settingsNotifier = SettingsNotifier();
  await settingsNotifier.initialize();
  GetIt.instance.registerSingleton(settingsNotifier);
}
