import 'package:app_state/app_state.dart';
import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

abstract class AppDelegate {
  Widget getMenu();
  void goHome();
  PageStacks get pageStacks;
  void showWord(WordPublic wordPublic);
}
