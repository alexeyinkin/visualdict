import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../pages/word/path.dart';
import '../pages/words/path.dart';

class MyRouteInformationParser extends PageStacksRouteInformationParser {
  @override
  // ignore: avoid_renaming_method_parameters
  Future<PagePath> parsePagePath(RouteInformation ri) async {
    // ignore: unnecessary_null_in_if_null_operators
    return null ??
        WordPath.tryParse(ri) ??

        // The default page if nothing worked.
        const WordsPath();
  }
}
