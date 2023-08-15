import 'package:flutter/material.dart';
import 'package:model_fetch/model_fetch.dart';
import 'package:visualdict/models/word_public.dart';
import 'package:visualdict/widgets/errors/loading_error.dart';

import '../../widgets/loading/small_circular_progress_indicator.dart';
import '../../widgets/my_scaffold.dart';

// import '../../widgets/technologies/technology_chapter_list.dart';
import 'state.dart';

class WordScreen extends StatelessWidget {
  final WordNotifier notifier;

  const WordScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scrolls: false,
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
      case null:
      case LoadStatus.error:
        return LoadingErrorWidget();
      case LoadStatus.notTried:
      case LoadStatus.loading:
        return SmallCircularProgressIndicator();
      case LoadStatus.ok:
        return Text(snapshot.data!.model!.senses.first.definition);
    }
  }
}
