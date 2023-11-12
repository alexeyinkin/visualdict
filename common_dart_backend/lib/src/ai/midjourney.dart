import 'package:midjourney_client/midjourney_client.dart' as midjourney_client;

import '../models/image_message.dart';
import 'image.dart';

// store somewhere
const mjServerId = '662267976984297473';
const mjChannelId = '1008571023047798794';
const _token =
    'Nzk5ODkyNzI4MTI0MDE0NjA0.GEJzUa.a8AqMPO16luL-zO8dFgKpvTTcFEJIOWwgdL2zw';

class MidjourneyService extends ImageAiService {
  final _client = midjourney_client.Midjourney();

  Future<void> _initializeClient() async {
    await _client.initialize(
      serverId: mjServerId,
      channelId: mjChannelId,
      token: _token,
      logLevel: midjourney_client.MLoggerLevel.verbose,
    );
  }

  @override
  Future<ImageMessage> generateImages(String prompt, int n) async {
    await _initializeClient();
    final image = await _client.imagine(prompt).finished;
    return ImageMessage.fromMidjourney(image);
  }

  @override
  Future<ImageMessage> upscaleImage(
    ImageMessage imageMessage,
    int index,
  ) async {
    await _initializeClient();
    final image = await _client
        .upscale(
          imageMessage.midjourneyMessage,
          index,
        )
        .finished;
    return ImageMessage.fromMidjourney(image);
  }

  @override
  Future<ImageMessage> variateImage(
    ImageMessage imageMessage,
    int index,
  ) async {
    await _initializeClient();
    final image = await _client
        .variation(
          imageMessage.midjourneyMessage,
          index,
        )
        .finished;
    return ImageMessage.fromMidjourney(image);
  }
}
