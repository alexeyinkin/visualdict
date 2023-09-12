import 'package:get_it/get_it.dart';

import '../controllers/settings.dart';
import '../loader_factories/word_public.dart';
import '../loader_factories/word_public_firestore.dart';
import '../loader_factories/word_public_firestore_json_files.dart';
import '../models/repository_engine.dart';
import '../services/toast_notifier.dart';

Future<void> initializeServiceLocator() async {
  _initializeLoaderFactories();
  await _initializeServices();
}

void _initializeLoaderFactories() {
  switch (RepositoryEngineEnum.current) {
    case RepositoryEngineEnum.flutterFire:
      GetIt.instance.registerSingleton<WordPublicLoaderFactory>(
        WordPublicFirestoreLoaderFactory(),
      );

    case RepositoryEngineEnum.terraformJson:
      GetIt.instance.registerSingleton<WordPublicLoaderFactory>(
        WordPublicFirestoreJsonFilesLoaderFactory(),
      );
  }
}

Future<void> _initializeServices() async {
  // GetIt.instance.registerSingleton(AuthenticationCubit());
  GetIt.instance.registerSingleton(ToastNotifier());

  final settingsNotifier = SettingsNotifier();
  await settingsNotifier.initialize();
  GetIt.instance.registerSingleton(settingsNotifier);
}
