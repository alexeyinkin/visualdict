import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';

import '../../controllers/app_delegate.dart';
import 'state.dart';

class WordsScreen extends StatelessWidget {
  final WordsNotifier notifier;

  const WordsScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      delegate: appDelegate,
      maxWidth: MySizes.maxHomePageWidth,
      bodySize: BodySize.finite,
      body: const SizedBox(),
    );
  }
}
