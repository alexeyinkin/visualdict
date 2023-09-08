import 'package:args/args.dart';

class WordExportArgs {
  final String lang;
  final String word;

  final bool all;
  final bool audioWordSilence;
  final bool postImage;
  final bool reel;
  final bool reelAudio;
  final bool reelOverlay;
  final bool texts;

  const WordExportArgs({
    required this.lang,
    required this.word,
    //
    required this.all,
    required this.audioWordSilence,
    required this.postImage,
    required this.reel,
    required this.reelAudio,
    required this.reelOverlay,
    required this.texts,
  });

  static WordExportArgs parse(List<String> args) {
    final parser = ArgParser();

    parser.addOption('lang', mandatory: true);

    parser.addFlag('all');
    parser.addFlag('audio-word-silence');
    parser.addFlag('post-image');
    parser.addFlag('reel');
    parser.addFlag('reel-audio');
    parser.addFlag('reel-overlay');
    parser.addFlag('texts');

    final result = parser.parse(args);

    return WordExportArgs(
      lang: result['lang'],
      word: result.rest[0],
      //
      all: result['all'],
      audioWordSilence: result['audio-word-silence'],
      postImage: result['post-image'],
      reel: result['reel'],
      reelAudio: result['reel-audio'],
      reelOverlay: result['reel-overlay'],
      texts: result['texts'],
    );
  }
}
