import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:midjourney_client/midjourney_client.dart' as midjourney_client;

import '../constants/midjourney.dart';
import '../constants/paths.dart';
import '../models/image_client_message.dart';
import 'image_generation.dart';

class MidjourneyService extends ImageGenerationService {
  final _client = midjourney_client.Midjourney();

  Future<void> _initializeClient() async {
    final token = getMjToken(toRepositoryRoot);
    await _client.initialize(
      serverId: mjServerId,
      channelId: mjChannelId,
      token: token,
      logLevel: midjourney_client.MLoggerLevel.verbose,
    );
  }

  @override
  Future<ImageClientMessage> generate({
    required String prompt,
  }) async {
    await _initializeClient();
    final image = await _client
        .imagine(
          prompt,
          seed: 12345,
        )
        .finished;
    return ImageClientMessage.fromMidjourney(image);
  }

  @override
  Future<ImageClientMessage> upscale({
    required ImageClientMessage generatedImagesMessage,
    required int index,
  }) async {
    await _initializeClient();
    final image = await _client
        .upscale(
          generatedImagesMessage.midjourneyMessage,
          index,
        )
        .finished;
    return ImageClientMessage.fromMidjourney(image);
  }

  @override
  Future<ImageClientMessage> variate({
    required ImageClientMessage generatedImagesMessage,
    required int index,
  }) async {
    await _initializeClient();
    final image = await _client
        .variation(
          generatedImagesMessage.midjourneyMessage,
          index,
        )
        .finished;
    return ImageClientMessage.fromMidjourney(image);
  }
}
