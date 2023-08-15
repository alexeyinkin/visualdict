import 'package:get_it/get_it.dart';

import 'loader_factories/word_public.dart';
import 'services/toast_notifier.dart';

Future<void> initializeServiceLocator() async {
  _initializeLoaderFactories();
  _initializeServices();
}

void _initializeLoaderFactories() {
  GetIt.instance.registerSingleton(WordPublicLoaderFactory());
}

void _initializeServices() {
  // GetIt.instance.registerSingleton(AuthenticationCubit());
  GetIt.instance.registerSingleton(ToastNotifier());
}
