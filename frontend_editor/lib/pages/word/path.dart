import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../../router/tab_enum.dart';
import '../words/path.dart';
import 'page.dart';

class WordPath extends PagePath {
  static final _regExp = RegExp(r'^/words/([-a-z]+)?$');

  final String id;

  WordPath({required this.id})
      : super(
          key: WordPage.classFactoryKey,
          factoryKey: WordPage.classFactoryKey,
          state: {'id': id},
        );

  @override
  String get location => '/words/$id';

  static WordPath? tryParse(RouteInformation ri) {
    final matches = _regExp.firstMatch(ri.uri.path);

    if (matches == null) return null;

    final id = matches[1];

    if (id == null) {
      return null; // Will never get here with present _regExp.
    }

    return WordPath(id: id);
  }

  @override
  List<PagePath> get defaultStackPaths => [
    const WordsPath(),
    this,
  ];

  @override
  String get defaultStackKey => TabEnum.words.name;
}
