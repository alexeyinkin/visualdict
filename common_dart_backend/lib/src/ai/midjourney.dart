import 'package:midjourney_client/midjourney_client.dart' as midjourney_client;

import '../models/image_client_message.dart';
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
  Future<ImageClientMessage> generateImages(String prompt, int n) async {
    await _initializeClient();
    final image = await _client.imagine(prompt).finished;
    return ImageClientMessage.fromMidjourney(image);
  }

  @override
  Future<ImageClientMessage> upscaleImage(
    ImageClientMessage imageMessage,
    int index,
  ) async {
    await _initializeClient();
    final image = await _client
        .upscale(
          imageMessage.midjourneyMessage,
          index,
        )
        .finished;
    return ImageClientMessage.fromMidjourney(image);
  }

  @override
  Future<ImageClientMessage> variateImage(
    ImageClientMessage imageMessage,
    int index,
  ) async {
    await _initializeClient();
    final image = await _client
        .variation(
          imageMessage.midjourneyMessage,
          index,
        )
        .finished;
    return ImageClientMessage.fromMidjourney(image);
  }
}
