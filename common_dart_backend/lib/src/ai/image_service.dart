import '../models/image_client_message.dart';

abstract class ImageAiService {
  Future<ImageClientMessage> generate({
    required String prompt,
    required int count,
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
