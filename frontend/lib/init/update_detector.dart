import 'package:get_it/get_it.dart';

import '../loader_factories/global.dart';
import '../models/global.dart';

void initializeUpdateDetector() {
  final bloc =
      GetIt.instance.get<GlobalLoaderFactory>().liveByIdBloc(Global.singleId);

  bloc.states.listen(
    (event) {
      final model = event.model;
      if (model == null) {
        return;
      }

      print('Minimal supported version: ${model.versions.min}');
    },
  );
}
