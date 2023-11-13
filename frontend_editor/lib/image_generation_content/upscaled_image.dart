import 'package:common_dart_backend/common_dart_backend.dart';

import 'abstract.dart';

class UpscaledImage extends ImageGenerationContent {
  final ImageClientMessage imageMessage;
  UpscaledImage({
    required this.imageMessage,
  });
}
