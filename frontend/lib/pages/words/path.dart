import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../../router/tab_enum.dart';
import 'page.dart';

class WordsPath extends PagePath {
  static const _location = '/';

  const WordsPath() : super(key: WordsPage.classFactoryKey);

  @override
  String get location => _location;

  static WordsPath? tryParse(RouteInformation ri) {
    final uri = Uri.parse(ri.location ?? '');
    if (uri.path != _location) return null;

    return const WordsPath();
  }

  @override
  String get defaultStackKey => TabEnum.words.name;
}
