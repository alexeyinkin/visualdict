import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';
import 'package:model_fetch_firestore/model_fetch_firestore.dart';
import 'package:model_interfaces/model_interfaces.dart';

import '../services/toast_notifier.dart';

// TODO(alexeyinkin): Better reloading, https://github.com/alexeyinkin/senior-dev/issues/105
final _blocsWithReloaders = <LazyLoadBloc>{};
const _interval = Duration(seconds: 15);

abstract class MyLoaderFactory<T extends WithId<String>,
    F extends AbstractFilter> extends AbstractFirestoreLoaderFactory<T, F> {
  @override
  LazyLoadBloc<T> frozenListBloc(F filter) {
    final bloc = super.frozenListBloc(filter) as FirestoreFrozenLazyLoadBloc<T>;

    if (!_blocsWithReloaders.contains(bloc)) {
      bloc.states.listen((state) async {
        if (state.items.isEmpty && !state.hasMore) {
          await Future.delayed(_interval);
          await bloc.clearAndLoadFirstPage();
        }
      });
      _blocsWithReloaders.add(bloc);
    }

    return bloc;
  }

  @override
  void onError(Object error, StackTrace trace) {
    print(error); // ignore: avoid_print
    print(trace); // ignore: avoid_print
    final notifier = GetIt.instance.get<ToastNotifier>();
    notifier.addThrowable(error);
  }
}
