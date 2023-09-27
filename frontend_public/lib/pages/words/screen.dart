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
    return MyScaffold(
      delegate: appDelegate,
      maxWidth: MySizes.maxHomePageWidth,
      scrolls: true,
      body: context.isMobileScreen()
          ? const NarrowWordsWidget()
          : const WideWordsWidget(),
    );
  }
}

class NarrowWordsWidget extends StatelessWidget {
  const NarrowWordsWidget();

  @override
  Widget build(BuildContext context) {
    return Container();
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
        Expanded(child: RecentImagedWordsWidget()),
      ],
    );
  }
}
