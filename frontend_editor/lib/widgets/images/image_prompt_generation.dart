import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/image_generation.dart';
import '../../controllers/image_prompt_generation.dart';
import '../../message_types/abstract.dart';
import '../../message_types/generated_image.dart';
import '../../message_types/upscaled_image.dart';

class ImagePromptGenerationWidget extends StatelessWidget {
  const ImagePromptGenerationWidget({
    required this.controller,
    required this.wordPublic,
  });

  final ImageGenerationController controller;
  final WordPublic wordPublic;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Column(
          children: [
            CollectionAddButtonBuilder(
              controller: controller.promptControllerList,
              enabledBuilder: (_) => IconButton(
                onPressed: () async {
                  await controller.generatePrompts(wordPublic.id);
                },
                icon: const Text('💬'),
              ),
            ),
            ReorderableListEditor(
              controller: controller.promptControllerList,
              itemBuilder: (_, c, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _PromptWidget(
                  controller: c,
                ),
              ),
              showDeleteThisAndAfterButtons: true,
              shrinkWrap: true,
            ),
          ],
        );
      },
    );
  }
}

class _PromptWidget extends StatelessWidget {
  final ImagePromptGenerationController controller;
  const _PromptWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextFormField(
                initialValue: controller.value,
                maxLines: null,
              ),
            ),
            IconButton(
              onPressed: () async {
                await controller.generateImages(controller.value!);
              },
              icon: const Icon(Icons.generating_tokens),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: controller.content
                .map(
                  (e) => _ImagePromptContentWidget(
                    content: e,
                    controller: controller,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

class _ImagePromptContentWidget extends StatelessWidget {
  final ImagePromptContent content;
  final ImagePromptGenerationController controller;

  const _ImagePromptContentWidget({
    required this.content,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (content is GeneratedImage) {
      // how to avoid cast?
      final image = content as GeneratedImage;
      return _GeneratedImageWidget(
        generatedImage: image,
        controller: controller,
      );
    } else if (content is UpscaledImage) {
      final image = content as UpscaledImage;
      return _UpscaledImageWidget(
        controller: controller,
        upscaledImage: image,
      );
    }

    return Container();
  }
}

class _GeneratedImageWidget extends StatelessWidget {
  const _GeneratedImageWidget({
    required this.generatedImage,
    required this.controller,
  });

  final ImagePromptGenerationController controller;
  final GeneratedImage generatedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(generatedImage.imageMessage.uri),
        _GeneratedImageButtons(
          imageMessage: generatedImage.imageMessage,
          controller: controller,
        ),
      ],
    );
  }
}

class _UpscaledImageWidget extends StatelessWidget {
  const _UpscaledImageWidget({
    required this.upscaledImage,
    required this.controller,
  });

  final ImagePromptGenerationController controller;
  final UpscaledImage upscaledImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(upscaledImage.imageMessage.uri),
        _DiscordLinkButton(
          messageId: upscaledImage.imageMessage.messageId,
        ),
      ],
    );
  }
}

class _GeneratedImageButtons extends StatelessWidget {
  final ImagePromptGenerationController controller;
  final ImageMessage imageMessage;

  const _GeneratedImageButtons({
    required this.controller,
    required this.imageMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            for (int i = 1; i <= 4; i++)
              TextButton(
                onPressed: () async {
                  await controller.upscaleImage(imageMessage, i);
                },
                child: Text('U$i'),
              ),
            _DiscordLinkButton(
              messageId: imageMessage.messageId,
            ),
          ],
        ),
        Wrap(
          children: [
            for (int i = 1; i <= 4; i++)
              TextButton(
                onPressed: () async {
                  await controller.variateImage(imageMessage, i);
                },
                child: Text('V$i'),
              ),
          ],
        ),
      ],
    );
  }
}

class _DiscordLinkButton extends StatelessWidget {
  const _DiscordLinkButton({
    required this.messageId,
  });

  final String messageId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final url =
            'https://discord.com/channels/$mjServerId/$mjChannelId/$messageId';
        await launchUrl(Uri.parse(url));
      },
      child: Text('D'),
    );
  }
}
