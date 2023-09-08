import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:create_pronunciation/tokens.dart';

const _toRoot = '../..';

class Mp3FragmentsVisitor extends PronunciationTokenVisitor {
  final Directory directory;
  int nextIndex = 0;

  Mp3FragmentsVisitor({
    required this.directory,
  });

  @override
  Future<void> visitDefinitionToken(DefinitionToken token) async {
    final dstDir = _getRawWordDir(token);
    final file = _pickNext();
    final name = wordToFileName(token.word);

    file.renameSync('${dstDir.path}/$name-def-${token.lang}.mp3');
  }

  @override
  Future<void> visitUsageToken(UsageToken token) async {
    final dstDir = _getRawWordDir(token);
    final file = _pickNext();
    final name = wordToFileName(token.word);

    file.renameSync('${dstDir.path}/$name-usage.mp3');
  }

  @override
  Future<void> visitWordToken(WordToken token) async {
    final dstDir = _getRawWordDir(token);
    final file = _pickNext();
    final name = wordToFileName(token.word);

    file.renameSync('${dstDir.path}/$name.mp3');

    await setWordPronunciationFromRaw(word: token.word, prefix: _toRoot);
  }

  Directory _getRawWordDir(PronunciationToken token) {
    final result = getRawWordDir(token.word, toRepositoryRoot: _toRoot);
    if (!result.existsSync()) {
      result.createSync(recursive: true);
    }
    return result;
  }

  File _pickNext() {
    final result = File('${directory.path}/$nextIndex.mp3');
    nextIndex++;
    return result;
  }
}
