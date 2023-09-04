import 'package:get_it/get_it.dart';

import '../services/toast_notifier.dart';

mixin LoaderFactoryMixin {
  void onError(Object error, StackTrace trace) {
    print(error); // ignore: avoid_print
    print(trace); // ignore: avoid_print

    final notifier = GetIt.instance.get<ToastNotifier>();
    notifier.addThrowable(error);
  }
}
