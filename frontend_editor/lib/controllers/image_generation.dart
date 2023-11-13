import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/widgets.dart';

import '../image_generation_content/abstract.dart';
import '../image_generation_content/generated_image.dart';
import '../image_generation_content/upscaled_image.dart';

class ImageGenerationController extends ValueNotifier<String?> {
  final List<ImageGenerationContent> content = [];

  ImageGenerationController() : super(null);

  Future<void> generateImages(String prompt) async {
    final result = await MidjourneyService().generateImages(
      prompt,
      imageGenerationNumber,
    );
    content.add(GeneratedImage(imageMessage: result));
    notifyListeners();
  }

  Future<void> upscaleImage(ImageClientMessage imageMessage, int index) async {
    final result = await MidjourneyService().upscaleImage(imageMessage, index);
    content.add(UpscaledImage(imageMessage: result));
    notifyListeners();
  }

  Future<void> variateImage(ImageClientMessage imageMessage, int index) async {
    final result = await MidjourneyService().variateImage(imageMessage, index);
    content.add(GeneratedImage(imageMessage: result));
    notifyListeners();
  }
}
