import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';

import '../../controllers/app_delegate.dart';
import '../../widgets/words/recent_imaged_words.dart';
import '../../widgets/words/word_of_the_day.dart';
import 'state.dart';

class WordsScreen extends StatelessWidget {
  final WordsNotifier notifier;

  const WordsScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileScreen();

    return MyScaffold(
      delegate: appDelegate,
      maxWidth: MySizes.maxHomePageWidth,
      bodySize: BodySize.finite,
      body: isMobile
          ? const NarrowWordsWidget()
          : const WideWordsWidget(),
      padding: !isMobile,
    );
  }
}

class NarrowWordsWidget extends StatelessWidget {
  const NarrowWordsWidget();

  @override
  Widget build(BuildContext context) {
    return const RecentImagedWordsWidget(spacing: false);
  }
}

class WideWordsWidget extends StatelessWidget {
  const WideWordsWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: WordOfTheDayWidget()),
        SizedBox(width: 30),
        Expanded(child: RecentImagedWordsWidget(spacing: true)),
      ],
    );
  }
}
