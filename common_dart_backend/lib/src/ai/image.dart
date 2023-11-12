import '../models/image_message.dart';

abstract class ImageAiService {
  Future<ImageMessage> generateImages(String prompt, int n);

  Future<ImageMessage> upscaleImage(ImageMessage imageMessage, int index);

  Future<ImageMessage> variateImage(ImageMessage imageMessage, int index);
}
