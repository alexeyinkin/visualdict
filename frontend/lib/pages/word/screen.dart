import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';
import 'package:model_fetch/model_fetch.dart';

import '../../constants/paths.dart';
import '../../models/repository_engine.dart';
import '../../widgets/errors/loading_error.dart';
import '../../widgets/loading/small_circular_progress_indicator.dart';
import '../../widgets/my_scaffold.dart';
import '../../widgets/words/edit/word_details.dart';
import '../../widgets/words/view/word_details.dart';
import 'state.dart';

class WordScreen extends StatelessWidget {
  final WordNotifier notifier;

  const WordScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scrolls: true,
      body: StreamBuilder(
        stream: notifier.bloc.states,
        builder: _buildOnChange,
      ),
    );
  }

  Widget _buildOnChange(
    BuildContext context,
    AsyncSnapshot<ModelByIdState<String, WordPublic>> snapshot,
  ) {
    final status = snapshot.data?.status;

    switch (status) {
      case LoadStatus.error:
        return const LoadingErrorWidget();

      case null:
      case LoadStatus.notTried:
      case LoadStatus.loading:
        return const SmallCircularProgressIndicator();

      case LoadStatus.ok:
        final wordPublic = snapshot.data!.model!;

        switch (RepositoryEngineEnum.current) {
          case RepositoryEngineEnum.flutterFire:
            return WordDetailsViewWidget(wordPublic);

          case RepositoryEngineEnum.terraformJson:
            return ModelViewOrEditWidget(
              createController: () => WordPublicEditingController(wordPublic),
              editBuilder: (_, __, c) => WordDetailsEditWidget(c),
              model: wordPublic,
              saveCallback: _save,
              viewBuilder: (_, w) => WordDetailsViewWidget(w),
            );
        }
    }
  }

  Future<void> _save(WordPublic wordPublic) async {
    writeWordPublicMap(
      wordPublic.id,
      wordPublic.toJson(),
      toRepositoryRoot: toRepositoryRoot,
    );
  }
}
