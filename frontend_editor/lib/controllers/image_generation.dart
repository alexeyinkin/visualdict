import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import 'image_prompt_generation.dart';

class ImageGenerationController extends ChangeNotifier {
  final List<ImagePromptGenerator> generators = [
    ChatGpt4ManualInstructionsImagePromptGenerator(),
  ];
  final promptControllerList =
      // TODO(nausharipov): what type argument to use?
      ListEditingController<String, ImagePromptGenerationController>(
    createItemController: ImagePromptGenerationController.new,
    maxLength: 5,
  );
}

// TODO(nausharipov): where to put?
class ChatGpt4ManualInstructionsImagePromptGenerator
    implements ImagePromptGenerator {
  ChatGpt4ManualInstructionsImagePromptGenerator();

  @override
  Future<List<String>> generate(String word) {
    // TODO: implement generate
    throw UnimplementedError();
    // send request
    // return the first 5 lines
  }
}

abstract interface class ImagePromptGenerator {
  Future<List<String>> generate(String word);
}
