import '../models/image_client_message.dart';
import 'abstract.dart';

class UpscaledImage extends ImageGenerationContent {
  final ImageClientMessage imageMessage;
  final ImageClientMessage parentMessage;
  UpscaledImage({
    required this.imageMessage,
    required this.parentMessage,
  });
}
