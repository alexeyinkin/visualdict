import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import '../constants.dart';

Future<void> exportReelAudio({
  required String word,
  required String lang,
}) async {
  final srcDir = getRawWordDir(word, toRepositoryRoot: toRoot);
  final exportWordDir = getExportWordDir(word, toRepositoryRoot: toRoot);
  final name = wordToFileName(word);

  final result = await Process.run(
    'ffmpeg',
    [
      ...FfmpegArgs.silence(const Duration(milliseconds: 750)),
      ...FfmpegArgs.input('${srcDir.path}/$name.mp3'),
      ...FfmpegArgs.silence(const Duration(milliseconds: 1500)),
      ...FfmpegArgs.input('${srcDir.path}/$name-def-$lang.mp3'),
      ...FfmpegArgs.silence(const Duration(milliseconds: 1000)),
      ...FfmpegArgs.input('assets/audio/example-$lang.mp3'),
      ...FfmpegArgs.input('${srcDir.path}/$name-usage.mp3'),
      ...FfmpegArgs.silence(const Duration(milliseconds: 1500)),
      ...FfmpegArgs.concatAudio(count: 8),
      ...FfmpegArgs.exportAudio('${exportWordDir.path}/$name-reel-$lang.mp3'),
    ],
  );

  if (result.exitCode != 0) {
    print(result.stderr);
    throw Exception(result);
  }
}
