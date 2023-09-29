import 'package:common_dart/common_dart.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';
import 'package:model_fetch/model_fetch.dart';

import '../../controllers/app_delegate.dart';
import 'state.dart';

class WordScreen extends StatelessWidget {
  final WordNotifier notifier;

  const WordScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      delegate: appDelegate,
      bodySize: BodySize.finite,
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
        return WordDetailsViewWidget(wordPublic);
    }
  }
}
