import '../models/image_client_message.dart';

abstract class ImageGenerationService {
  Future<ImageClientMessage> generate({
    required String prompt,
  });

  Future<ImageClientMessage> upscale({
    required ImageClientMessage generatedImagesMessage,
    required int index,
  });

  Future<ImageClientMessage> variate({
    required ImageClientMessage generatedImagesMessage,
    required int index,
  });
}
