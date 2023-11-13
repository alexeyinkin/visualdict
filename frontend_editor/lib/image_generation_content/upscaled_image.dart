import '../models/image_client_message.dart';
import 'abstract.dart';

class UpscaledImage extends ImageGenerationContent {
  final ImageClientMessage imageMessage;
  UpscaledImage({
    required this.imageMessage,
  });
}
