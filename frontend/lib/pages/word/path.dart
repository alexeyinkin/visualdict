import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../../router/tab_enum.dart';
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
    // print('Start tryParse in TechnologyPath');
    final matches = _regExp.firstMatch(ri.location ?? '');

    if (matches == null) return null;
    // print('Start tryParse in TechnoDisamb != null');

    final id = matches[1];

    // print(id);

    if (id == null) {
      return null; // Will never get here with present _regExp.
    }

    return WordPath(id: id);
  }

  @override
  String get defaultStackKey => TabEnum.search.name;
}
