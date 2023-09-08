import 'dart:io';

import 'package:clock/clock.dart';
import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:path/path.dart';

import 'args.dart';

const _toRoot = '../..';
const _quality = 90; // Out of 100
const _imageMagickCommand = 'convert';

const _hashSizes = [
  null,
  '${Resolutions.thumb}x${Resolutions.thumb}',
];

const _nonHashSizes = [
  '24x24',
];

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordImageArgs.parse(rawArgs);

  if (!args.public) {
    throw UnimplementedError('Non-public words are not implemented yet.');
  }

  final srcDir = getRawWordDir(args.word, toRepositoryRoot: _toRoot);
  final srcFile = File('${srcDir.path}/${args.word}.png');
  final wordRaw = getWordRaw(args.word, toRepositoryRoot: _toRoot);
  final dstDir = getProcessedWordDir(args.word, toRepositoryRoot: _toRoot);

  final secondsSinceEpoch = clock.now().secondsSinceEpoch;
  final hash = getFileHashForName(srcFile.readAsBytesSync());

  if (!dstDir.existsSync()) {
    dstDir.createSync(recursive: true);
  }

  _deleteOldImages(dstDir: dstDir, word: args.word);

  for (final size in _hashSizes) {
    await _convert(
      srcFile: srcFile,
      dstDir: dstDir,
      word: args.word,
      secondsSinceEpoch: secondsSinceEpoch,
      hash: hash,
      resize: size,
    );
  }

  for (final size in _nonHashSizes) {
    await _convert(
      srcFile: srcFile,
      dstDir: dstDir,
      word: args.word,
      secondsSinceEpoch: secondsSinceEpoch,
      resize: size,
    );
  }

  final map = getWordPublicMap(args.word, toRepositoryRoot: _toRoot);

  final image = Image(
    timestamp: secondsSinceEpoch,
    hash: hash,
    prompt: wordRaw.prompt,
  );
  map['image'] = image.toJson();

  writeWordPublicMap(args.word, map, toRepositoryRoot: _toRoot);
}

void _deleteOldImages({
  required Directory dstDir,
  required String word,
}) {
  final re =
      RegExp('^' + RegExp.escape(word) + r'-\d+(-[0-9a-f]+)?(-\d+)?\.jpg$');
  for (final entry in dstDir.listSync()) {
    final name = basename(entry.path);
    if (re.hasMatch(name)) {
      entry.deleteSync();
    }
  }
}

Future<void> _convert({
  required File srcFile,
  required Directory dstDir,
  required String word,
  required int secondsSinceEpoch,
  String? hash,
  String? resize,
}) async {
  final hashPart = hash == null ? '' : '-$hash';
  final resolutionPart = resize == null ? '' : '-' + resize.split('x').first;

  final result = await Process.run(
    _imageMagickCommand,
    [
      //
      srcFile.path,
      '-quality', '$_quality',
      if (resize != null) ...['-resize', resize],
      '${dstDir.path}/$word-$secondsSinceEpoch$hashPart$resolutionPart.jpg',
    ],
  );

  if (result.exitCode != 0) {
    throw Exception('Failed to convert an image: ${result.stderr}');
  }
}
