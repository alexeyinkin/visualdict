import 'package:flutter/material.dart';
import 'package:model_fetch/model_fetch.dart';

import '../../models/word_public.dart';
import '../../util/build_context.dart';
import '../../widgets/errors/loading_error.dart';
import '../../widgets/loading/small_circular_progress_indicator.dart';
import '../../widgets/my_scaffold.dart';
import '../../widgets/words/word_narrow.dart';
import '../../widgets/words/word_wide.dart';
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
        final isMobile = context.isMobileScreen();

        return isMobile
            ? WordNarrowWidget(wordPublic)
            : WordWideWidget(wordPublic);
    }
  }
}
