import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/widgets.dart';

import '../image_generation_content/abstract.dart';
import '../image_generation_content/generated_image.dart';
import '../image_generation_content/upscaled_image.dart';

class ImageGenerationController extends ValueNotifier<String?> {
  final List<ImageGenerationContent> content = [];

  ImageGenerationController() : super(null);

  Future<void> generate({
    required String prompt,
  }) async {
    final result = await MidjourneyService().generate(
      prompt: prompt,
      count: imageGenerationCount,
    );
    content.add(GeneratedImage(imageMessage: result));
    notifyListeners();
  }

  Future<void> upscale({
    required ImageClientMessage generatedImagesMessage,
    required int index,
  }) async {
    final result = await MidjourneyService().upscale(
      generatedImagesMessage: generatedImagesMessage,
      index: index,
    );
    content.add(UpscaledImage(imageMessage: result));
    notifyListeners();
  }

  Future<void> variate({
    required ImageClientMessage generatedImagesMessage,
    required int index,
  }) async {
    final result = await MidjourneyService().variate(
      generatedImagesMessage: generatedImagesMessage,
      index: index,
    );
    content.add(GeneratedImage(imageMessage: result));
    notifyListeners();
  }
}
