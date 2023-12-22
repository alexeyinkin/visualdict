import 'package:midjourney_client/midjourney_client.dart' as midjourney_client;

/// Wrapper for client message classes, such as MidjourneyMessageImageFinish.
class ImageClientMessage {
  final String messageId;
  final String content;
  final String? jobId;
  final String uri;
  final String id;
  final int? seed;

  const ImageClientMessage({
    required this.messageId,
    required this.content,
    required this.jobId,
    required this.uri,
    required this.id,
    required this.seed,
  });

  midjourney_client.MidjourneyMessageImageFinish get midjourneyMessage =>
      midjourney_client.MidjourneyMessageImageFinish(
        messageId: messageId,
        content: content,
        jobId: jobId!,
        uri: uri,
        id: id,
      );

  factory ImageClientMessage.fromMidjourney(
    midjourney_client.MidjourneyMessageImageFinish message,
  ) {
    return ImageClientMessage(
      messageId: message.messageId,
      content: message.content,
      jobId: message.jobId,
      uri: message.uri!,
      id: message.id,
      seed: message.seed,
    );
  }
}
