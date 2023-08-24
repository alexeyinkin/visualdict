import 'package:common_dart/common_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class PartOfSpeechWidget extends StatelessWidget {
  final PartOfSpeechEnum partOfSpeech;

  const PartOfSpeechWidget(this.partOfSpeech);

  @override
  Widget build(BuildContext context) {
    return Text(
      'pos.full.${partOfSpeech.name}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ).tr();
  }
}
