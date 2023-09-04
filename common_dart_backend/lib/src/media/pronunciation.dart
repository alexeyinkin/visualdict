import 'dart:io';

import 'package:clock/clock.dart';
import 'package:common_dart/common_dart.dart';
import 'package:path/path.dart';

import '../util/crypto.dart';
import '../util/datetime.dart';
import '../util/paths.dart';
import '../util/terraform.dart';

Future<void> setWordPronunciationFromRaw({
  required String word,
  required String prefix,
}) async {
  final srcDir = getRawWordDir(word, prefix: prefix);
  final name = wordToFileName(word);
  final srcFile = File('${srcDir.path}/$name.mp3');

  final dstDir = getProcessedWordDir(word, prefix: prefix);

  final secondsSinceEpoch = clock.now().secondsSinceEpoch;
  final hash = getFileHashForName(srcFile.readAsBytesSync());

  if (!dstDir.existsSync()) {
    dstDir.createSync(recursive: true);
  }

  _deleteOldSounds(dstDir: dstDir, name: name);

  await _copy(
    srcFile: srcFile,
    dstDir: dstDir,
    name: name,
    secondsSinceEpoch: secondsSinceEpoch,
    hash: hash,
  );

  final map = getWordPublicMap(word, toRepositoryRoot: prefix);

  final image = Pronunciation(
    timestamp: secondsSinceEpoch,
    hash: hash,
  );
  map['pronunciation'] = image.toJson();

  writeWordPublicMap(word, map, toRepositoryRoot: prefix);
}

void _deleteOldSounds({
  required Directory dstDir,
  required String name,
}) {
  final re = RegExp('^' + RegExp.escape(name) + r'-\d+-[0-9a-f]+\.mp3$');
  for (final entry in dstDir.listSync()) {
    final entryName = basename(entry.path);
    if (re.hasMatch(entryName)) {
      entry.deleteSync();
    }
  }
}

Future<void> _copy({
  required File srcFile,
  required Directory dstDir,
  required String name,
  required int secondsSinceEpoch,
  String? hash,
}) async {
  final hashPart = hash == null ? '' : '-$hash';
  final newPath = '${dstDir.path}/$name-$secondsSinceEpoch$hashPart.mp3';
  await srcFile.copy(newPath);
}
