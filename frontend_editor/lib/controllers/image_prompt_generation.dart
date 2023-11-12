import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/widgets.dart';

import '../message_types/abstract.dart';
import '../message_types/generated_image.dart';
import '../message_types/upscaled_image.dart';

class ImagePromptGenerationController extends ValueNotifier<String?> {
  bool isChecked = false;
  final promptTextController = TextEditingController();
  final List<ImagePromptContent> content = [];

  ImagePromptGenerationController() : super(null);

  Future<void> generateImages(String prompt) async {
    final result = await MidjourneyService().generateImages(prompt, 4);
    content.add(GeneratedImage(imageMessage: result));
    notifyListeners();
  }

  Future<void> upscaleImage(ImageMessage imageMessage, int index) async {
    final result = await MidjourneyService().upscaleImage(imageMessage, index);
    content.add(UpscaledImage(imageMessage: result));
    notifyListeners();
  }

  Future<void> variateImage(ImageMessage imageMessage, int index) async {
    final result = await MidjourneyService().variateImage(imageMessage, index);
    content.add(GeneratedImage(imageMessage: result));
    notifyListeners();
  }
}
