import 'dart:async';

import 'package:clock/clock.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../filters/word_public.dart';
import '../../loader_factories/word_public.dart';
import '../../theme/theme.dart';
import '../layout/h2.dart';
import '../loading/small_circular_progress_indicator.dart';
import 'word_narrow.dart';

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
            item == null
                ? const SmallCircularProgressIndicator()
                : WordNarrowWidget(item)
          ],
        );
      },
    );
  }
}
