import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import 'image_prompt_generation.dart';

class ImageGenerationController extends ChangeNotifier {
  final List<ImagePromptGenerator> generators = [
    ChatGpt4ManualInstructionsImagePromptGenerator(),
  ];
  final promptControllerList =
      ListEditingController<String, ImagePromptGenerationController>(
    createItemController: ImagePromptGenerationController.new,
    maxLength: 30,
  );

  Future<void> generatePrompts(String word) async {
    final prompts = await generators.first.getImagePrompts(word);
    prompts.forEach(promptControllerList.add);
  }
}

class ChatGpt4ManualInstructionsImagePromptGenerator
    implements ImagePromptGenerator {
  ChatGpt4ManualInstructionsImagePromptGenerator();

  @override
  Future<List<String>> getImagePrompts(String word) async {
    return ChatGpt4Service().getImageGenerationPrompts(word);
  }
}

abstract interface class ImagePromptGenerator {
  Future<List<String>> getImagePrompts(String word);
}
