import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';
import 'package:model_fetch_firestore/model_fetch_firestore.dart';
import 'package:model_interfaces/model_interfaces.dart';

// TODO(alexeyinkin): Better reloading, https://github.com/alexeyinkin/senior-dev/issues/105
final _blocsWithReloaders = <LazyLoadBloc>{};
const _interval = Duration(seconds: 15);

abstract class MyFirestoreLoaderFactory<T extends WithId<String>,
    F extends AbstractFilter> extends AbstractFirestoreLoaderFactory<T, F> {
  @override
  // FirestoreFrozenLazyLoadBloc<T> createFrozenListBloc(F filter) {
  //   final bloc = super.createFrozenListBloc(filter);
  //
  //   if (!_blocsWithReloaders.contains(bloc)) {
  //     bloc.states.listen((state) async {
  //       if (state.items.isEmpty && !state.hasMore) {
  //         await Future.delayed(_interval);
  //         await bloc.clearAndLoadFirstPage();
  //       }
  //     });
  //     _blocsWithReloaders.add(bloc);
  //   }
  //
  //   return bloc;
  // }

  @override
  void onError(Object error, StackTrace trace) {
    print(error); // ignore: avoid_print
    print(trace); // ignore: avoid_print
    final notifier = GetIt.instance.get<ToastNotifier>();
    notifier.addThrowable(error);
  }
}
