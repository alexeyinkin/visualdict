import 'package:app_state/app_state.dart';
import 'package:flutter/foundation.dart';

import 'screen.dart';
import 'state.dart';

class WordPage extends StatefulMaterialPage<void, WordNotifier> {
  static const classFactoryKey = 'Word';

  final String id;

  WordPage({
    required this.id,
  }) : super(
          key: ValueKey(
            formatKey(
              id: id,
            ),
          ),
          factoryKey: classFactoryKey,
          state: WordNotifier(id: id),
          createScreen: WordScreen.new,
        );

  // ignore: avoid_unused_constructor_parameters
  factory WordPage.fromState(Map<String, dynamic> state) =>
      WordPage(id: state['id']);

  static String formatKey({required String id}) {
    return '${classFactoryKey}_$id';
  }
}
