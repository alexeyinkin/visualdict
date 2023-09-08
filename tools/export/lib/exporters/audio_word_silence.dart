import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import '../constants.dart';

Future<void> exportAudioWordSilence({
  required String word,
}) async {
  final srcDir = getRawWordDir(word, toRepositoryRoot: toRoot);
  final exportWordDir = getExportWordDir(word, toRepositoryRoot: toRoot);
  final name = wordToFileName(word);

  final result = await Process.run(
    'ffmpeg',
    [
      ...FfmpegArgs.input('${srcDir.path}/$name.mp3'),
      ...FfmpegArgs.silence(const Duration(seconds: 4)),
      ...FfmpegArgs.concatAudio(count: 2),
      ...FfmpegArgs.exportAudio('${exportWordDir.path}/$name.mp3'),
    ],
  );

  if (result.exitCode != 0) {
    print(result.stderr);
    throw Exception(result);
  }
}
