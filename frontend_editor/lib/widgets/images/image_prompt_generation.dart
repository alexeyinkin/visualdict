import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/image_generation.dart';
import '../../controllers/image_prompt_generation.dart';
import '../../image_generation_content/abstract.dart';
import '../../image_generation_content/generated_image.dart';
import '../../image_generation_content/upscaled_image.dart';

class ImagePromptGenerationWidget extends StatelessWidget {
  const ImagePromptGenerationWidget({
    required this.controller,
    required this.wordPublic,
  });

  final ImagePromptGenerationController controller;
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
                  await controller.generateImagePrompts(wordPublic.id);
                },
                icon: const Text('Generate image prompts'),
              ),
            ),
            ReorderableListEditor(
              controller: controller.promptControllerList,
              itemBuilder: (_, c, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _ImagePromptWidget(
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

class _ImagePromptWidget extends StatelessWidget {
  final ImageGenerationController controller;
  const _ImagePromptWidget({
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
                  (e) => _ImageGenerationContentWidget(
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

class _ImageGenerationContentWidget extends StatelessWidget {
  final ImageGenerationContent content;
  final ImageGenerationController controller;

  const _ImageGenerationContentWidget({
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

  final ImageGenerationController controller;
  final GeneratedImage generatedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(generatedImage.imageMessage.uri),
        _GeneratedImageButtons(
          imageClientMessage: generatedImage.imageMessage,
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

  final ImageGenerationController controller;
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
  final ImageGenerationController controller;
  final ImageClientMessage imageClientMessage;

  const _GeneratedImageButtons({
    required this.controller,
    required this.imageClientMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            for (int i = 1; i <= imageGenerationNumber; i++)
              TextButton(
                onPressed: () async {
                  await controller.upscaleImage(imageClientMessage, i);
                },
                child: Text('U$i'),
              ),
            _DiscordLinkButton(
              messageId: imageClientMessage.messageId,
            ),
          ],
        ),
        Wrap(
          children: [
            for (int i = 1; i <= imageGenerationNumber; i++)
              TextButton(
                onPressed: () async {
                  await controller.variateImage(imageClientMessage, i);
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
      child: const Text('Discord'),
    );
  }
}
