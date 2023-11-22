import 'dart:io';

import 'package:common_dart/common_dart.dart';

const rawWordsRoot = '/raw/words';
const _processedWordsRoot = '/static/w';
const _exportWordsRoot = '/export';

Directory getRawWordDir(String word, {String toRepositoryRoot = '.'}) {
  final nesting = alphabeticNesting(word);
  final name = wordToFileName(word);
  final path = '$toRepositoryRoot$rawWordsRoot/$nesting/$name';
  return Directory(path);
}

Directory getProcessedWordDir(String word, {String toRepositoryRoot = '.'}) {
  final nesting = alphabeticNesting(word);
  final name = wordToFileName(word);
  final path = '$toRepositoryRoot$_processedWordsRoot/$nesting/$name';
  return Directory(path);
}

Directory getExportWordDir(String word, {String toRepositoryRoot = '.'}) {
  final name = wordToFileName(word);
  final path = '$toRepositoryRoot$_exportWordsRoot/$name';
  return Directory(path);
}

File getWordPngFile({
  required Directory directory,
  required String fileName,
}) {
  return File('${directory.path}/$fileName.png');
}

File getWordYamlFile({
  required Directory directory,
  required String fileName,
}) {
  return File('${directory.path}/$fileName.yaml');
}
