import 'dart:async';

import 'package:clock/clock.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class WordOfTheDayWidget extends StatelessWidget {
  const WordOfTheDayWidget();

  @override
  Widget build(BuildContext context) {
    // TODO: Periodic rebuild.
    final now = clock.now().toUtc();
    final dateString = now.toIso8601String().substring(0, 'YYYY-MM-DD'.length);
    final filter = WordPublicFilter.ofTheDay(dateString);
    final factory = GetIt.instance.get<WordPublicLoaderFactory>();
    final bloc = factory.frozenListBloc(filter);

    unawaited(bloc.loadAllIfCan());

    return StreamBuilder(
      stream: bloc.states,
      builder: (context, snapshot) {
        final item = snapshot.data?.items.firstOrNull;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            H2Widget('WordOfTheDayWidget.text'.tr()),
            const MySpacing(),
            if (item == null)
              const SmallCircularProgressIndicator()
            else
              WordNarrowViewWidget(item),
          ],
        );
      },
    );
  }
}
