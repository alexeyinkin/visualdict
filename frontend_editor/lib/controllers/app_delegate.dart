import 'dart:async';

import 'package:app_state/app_state.dart';
import 'package:common_dart/common_dart.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/widgets.dart';

import '../pages/word/page.dart';
import '../router/page_stacks.dart' as ps;

final appDelegate = EditorAppDelegate();

class EditorAppDelegate extends AppDelegate {
  @override
  Widget getMenu() {
    return const SizedBox();
  }

  @override
  void goHome() {
    ps.pageStacks.currentStack!.popUntilBottom();
  }

  @override
  PageStacks get pageStacks => ps.pageStacks;

  @override
  void showWord(WordPublic wordPublic) {
    final page = WordPage(id: wordPublic.id);
    unawaited(ps.pageStacks.currentStack!.push(page));
  }
}
