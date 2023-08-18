import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import '../../theme/theme.dart';

class WordTranscriptionWidget extends StatelessWidget {
  final WordPublic wordPublic;

  const WordTranscriptionWidget(this.wordPublic);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("/${wordPublic.transcription}/"),
        if (_canPlay()) ...[
          const MySpacing(),
          IconButton(
            onPressed: _onPlayPressed,
            icon: Icon(Icons.volume_up),
          ),
        ],
      ],
    );
  }

  bool _canPlay() => wordPublic.pronunciationUrl != null;

  Future<void> _onPlayPressed() async {
    final player = AudioPlayer();
    await player.play(UrlSource(wordPublic.pronunciationUrl.toString()));
  }
}
