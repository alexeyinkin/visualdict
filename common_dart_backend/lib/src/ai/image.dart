import '../models/image_client_message.dart';

abstract class ImageAiService {
  Future<ImageClientMessage> generateImages(String prompt, int n);

  Future<ImageClientMessage> upscaleImage(
    ImageClientMessage imageMessage,
    int index,
  );

  Future<ImageClientMessage> variateImage(
    ImageClientMessage imageMessage,
    int index,
  );
}
