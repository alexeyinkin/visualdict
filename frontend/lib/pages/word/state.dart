import 'dart:async';

import 'package:app_state/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';

// import 'package:get_it/get_it.dart';
// import 'package:model_fetch/model_fetch.dart';

// import '../../filters/technology_chapter.dart';
// import '../../loader_factories/technology_chapter.dart';
// import '../../models/technology_chapter.dart';
import '../../loader_factories/word_public.dart';
import '../../models/word_public.dart';
import 'path.dart';

class WordNotifier extends ChangeNotifier with PageStateMixin<void> {
  WordNotifier({
    required this.id,
  }) : bloc = GetIt.instance.get<WordPublicLoaderFactory>().liveByIdBloc(id);

  final String id;
  final ModelByIdBloc<String, WordPublic> bloc;

  // LazyLoadBloc<TechnologyChapter> bloc;

  @override
  WordPath get path => WordPath(
        id: id,
      );
}
