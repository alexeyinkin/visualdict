//import 'package:audioplayers/audioplayers.dart';
import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class WordTranscriptionViewWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordTranscriptionViewWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    final canPlay = _canPlay();

    if (!canPlay && wordPublic.transcription == '') {
      return const SizedBox();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (wordPublic.transcription != '')
          Text('/${wordPublic.transcription}/'),
        if (canPlay) ...[
          const MySpacing(),
          IconButton(
            onPressed: _onPlayPressed,
            icon: const Icon(Icons.volume_up),
          ),
        ],
      ],
    );
  }

  bool _canPlay() => wordPublic.pronunciation != null;

  Future<void> _onPlayPressed() async {
    // final player = AudioPlayer();
    // await player.play(
    //   UrlSource(wordPublic.pronunciation!.getUrl(wordPublic.id).toString()),
    // );
  }
}
