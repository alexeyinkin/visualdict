import '../models/image_client_message.dart';
import 'abstract.dart';

class UpscaledImage extends ImageGenerationContent {
  final ImageClientMessage imageMessage;

  /// Needed to get image metadata from midjourney_client (https://github.com/hawkkiller/midjourney_client/issues/54)
  final ImageClientMessage parentMessage;

  UpscaledImage({
    required this.imageMessage,
    required this.parentMessage,
  });
}
