import 'package:app_state/app_state.dart';
import 'package:common_dart/common_dart.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';

import 'path.dart';

class WordNotifier extends ChangeNotifier with PageStateMixin<void> {
  WordNotifier({
    required this.id,
  }) : bloc = GetIt.instance.get<WordPublicLoaderFactory>().liveByIdBloc(id);

  final String id;
  final ModelByIdBloc<String, WordPublic> bloc;

  @override
  WordPath get path => WordPath(
        id: id,
      );
}
