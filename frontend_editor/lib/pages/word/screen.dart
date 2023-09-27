import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:model_editors/model_editors.dart';
import 'package:model_fetch/model_fetch.dart';

import '../../constants/paths.dart';
import '../../controllers/app_delegate.dart';
import '../../controllers/word_public.dart';
import '../../widgets/words/word_details.dart';
import 'state.dart';

class WordScreen extends StatelessWidget {
  final WordNotifier notifier;

  const WordScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      delegate: appDelegate,
      scrolls: false,
      body: StreamBuilder(
        stream: notifier.bloc.states,
        builder: _buildTerraformJsonOnChange,
      ),
    );
  }

  Widget _buildTerraformJsonOnChange(
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

        return Expanded(
          child: ModelViewOrEditWidget(
            createController: () => WordPublicEditingController(wordPublic),
            editBuilder: (_, __, c, buttons) => FixedHeaderWidget(
              header: buttons,
              child: WordDetailsEditWidget(c),
            ),
            model: wordPublic,
            saveCallback: _save,
            viewBuilder: (_, w, buttons) => FixedHeaderWidget(
              header: buttons,
              child: WordDetailsViewWidget(w),
            ),
            buttonRowBuilder: (context, row) => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: notifier.bloc.reload,
                  child: Text("Reload"),
                ),
                const MySpacing(),
                const MySpacing(),
                row,
              ],
            ),
          ),
        );
    }
  }

  Future<void> _save(WordPublic wordPublic) async {
    try {
      await _trySave(wordPublic);
    } on Object catch (ex) {
      GetIt.instance.get<ToastNotifier>().addThrowable(ex);
      rethrow;
    }
  }

  Future<void> _trySave(WordPublic wordPublic) async {
    final posCount = <PartOfSpeechEnum, int>{};

    for (final one in wordPublic.partOfSpeechSenses) {
      posCount[one.partOfSpeech] = (posCount[one.partOfSpeech] ?? 0) + 1;
    }

    posCount.removeWhere((_, value) => value == 1);
    if (posCount.isNotEmpty) {
      throw Exception(
        'Duplicate parts of speech: ${posCount.keys.map((pos) => pos.name)}',
      );
    }

    writeWordPublicMap(
      wordPublic.id,
      wordPublic.toJson(),
      toRepositoryRoot: toRepositoryRoot,
    );

    notifier.bloc.reload();
  }
}
