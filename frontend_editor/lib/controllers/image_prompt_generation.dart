import 'package:flutter/widgets.dart';

class ImagePromptGenerationController extends ValueNotifier<String?> {
  bool isChecked = false;
  final promptTextController = TextEditingController();
  // some data structure with midjourney data

  ImagePromptGenerationController() : super(null);
}
