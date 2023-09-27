import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:get_it/get_it.dart';

import '../loader_factories/word_public_firestore_json_files.dart';
import '../services/country.dart';

Future<void> initializeServiceLocator() async {
  _initializeLoaderFactories();
  await _initializeServices();
}

void _initializeLoaderFactories() {
  GetIt.instance.registerSingleton<WordPublicLoaderFactory>(
    WordPublicFirestoreJsonFilesLoaderFactory(),
  );
}

Future<void> _initializeServices() async {
  // GetIt.instance.registerSingleton(AuthenticationCubit());
  GetIt.instance.registerSingleton(CountryService());
  GetIt.instance.registerSingleton(ToastNotifier());

  final settingsNotifier = SettingsNotifier();
  await settingsNotifier.initialize();
  GetIt.instance.registerSingleton(settingsNotifier);
}
