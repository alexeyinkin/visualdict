import 'dart:io';

import 'package:clock/clock.dart';
import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:path/path.dart';

const _toRoot = '../..';
// Moved to create_pronunciation
// Future<void> main(List<String> rawArgs) async {
//   initOpenAiKey(_toRoot);
//   final args = WordArgs.parse(rawArgs);
//
//   final srcDir = getRawWordDir(args.word, prefix: _toRoot);
//   final srcFile = File('${srcDir.path}/${args.word}.mp3');
//
//   final dstDir = getProcessedWordDir(args.word, prefix: _toRoot);
//
//   final secondsSinceEpoch = clock.now().secondsSinceEpoch;
//   final hash = getFileHashForName(srcFile.readAsBytesSync());
//
//   if (!dstDir.existsSync()) {
//     dstDir.createSync(recursive: true);
//   }
//
//   _deleteOldSounds(dstDir: dstDir, word: args.word);
//
//   await _copy(
//     srcFile: srcFile,
//     dstDir: dstDir,
//     word: args.word,
//     secondsSinceEpoch: secondsSinceEpoch,
//     hash: hash,
//   );
//
//   final map = getWordPublicMap(args.word, prefix: _toRoot);
//
//   final image = Pronunciation(
//     timestamp: secondsSinceEpoch,
//     hash: hash,
//   );
//   map['pronunciation'] = image.toJson();
//
//   writeWordPublicMap(args.word, map, prefix: _toRoot);
// }
//
// void _deleteOldSounds({
//   required Directory dstDir,
//   required String word,
// }) {
//   final re = RegExp('^' + RegExp.escape(word) + r'-\d+-[0-9a-f]+\.mp3$');
//   for (final entry in dstDir.listSync()) {
//     final name = basename(entry.path);
//     if (re.hasMatch(name)) {
//       entry.deleteSync();
//     }
//   }
// }
//
// Future<void> _copy({
//   required File srcFile,
//   required Directory dstDir,
//   required String word,
//   required int secondsSinceEpoch,
//   String? hash,
// }) async {
//   final hashPart = hash == null ? '' : '-$hash';
//   final newPath = '${dstDir.path}/$word-$secondsSinceEpoch$hashPart.mp3';
//   await srcFile.copy(newPath);
// }
