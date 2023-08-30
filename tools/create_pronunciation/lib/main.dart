import 'dart:convert';
import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';

const _toRoot = '../..';
const _perLine = 25;
const _silenceDb = -50;
const _generateSilenceDuration = Duration(milliseconds: 1500);
final _detectSilenceDuration =
    _generateSilenceDuration + Duration(milliseconds: 0); // Natural pausing.
final _glue = '[pause ${_generateSilenceDuration.inMilliseconds / 1000}s]';
final _tempDir = Directory('temp');

Future<void> main(List<String> rawArgs) async {
  final args = WordCreatePronunciationArgs.parse(rawArgs);
  // As the Terms of Service of Murf.ai disallow automation,
  // this script creates a single piece of text
  // to be given to the service and exported manually.
  // It is then split to produce individual words' MP3s.

  final words = [
    ...{
      ...await stdin.transform(utf8.decoder).transform(LineSplitter()).toList()
    }
  ];

  if (args.generate) {
    // Generate the input for Murf.ai
    final paragraphs = words
        .chunks(_perLine)
        .map((words) => words.map((w) => '$w.').join(_glue))
        .join('\n$_glue\n');

    print(paragraphs);
    return;
  }

  if (args.split != null) {
    await splitMp3BySilence(
      input: File(args.split!),
      minDuration: _detectSilenceDuration,
      dstDir: _tempDir,
      fileNames: words,
    );

    for (final word in words) {
      _moveWordFile(
        word: word,
        srcDir: _tempDir,
      );

      await setWordPronunciationFromRaw(word: word, prefix: _toRoot);
    }

    return;
  }

  throw Exception('Provide either --generate, or --split.');
}

void _moveWordFile({
  required String word,
  required Directory srcDir,
}) {
  final dstDir = getRawWordDir(word, prefix: _toRoot);
  if (!dstDir.existsSync()) {
    dstDir.createSync(recursive: true);
  }

  final name = wordToFileName(word);
  final file = File('${srcDir.path}/$name.mp3');
  file.renameSync('${dstDir.path}/$name.mp3');
}
