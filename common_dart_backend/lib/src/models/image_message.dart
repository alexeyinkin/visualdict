import 'package:midjourney_client/midjourney_client.dart' as midjourney_client;

class ImageMessage {
  final String messageId;
  final String content;
  final String uri;
  final String id;

  ImageMessage({
    required this.messageId,
    required this.content,
    required this.uri,
    required this.id,
  });

  midjourney_client.MidjourneyMessageImageFinish get midjourneyMessage =>
      midjourney_client.MidjourneyMessageImageFinish(
        messageId: messageId,
        content: content,
        uri: uri,
        id: id,
      );

  factory ImageMessage.fromMidjourney(
    midjourney_client.MidjourneyMessageImageFinish message,
  ) {
    return ImageMessage(
      messageId: message.messageId,
      content: message.content,
      uri: message.uri!,
      id: message.id,
    );
  }
}
