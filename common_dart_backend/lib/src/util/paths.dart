import 'dart:io';

import 'package:common_dart/common_dart.dart';

const _rawWordsRoot = '/raw/words';
const _processedWordsRoot = '/static/w';
const _exportWordsRoot = '/export';

Directory getRawWordDir(String word, {String toRepositoryRoot = '.'}) {
  final nesting = alphabeticNesting(word);
  final name = wordToFileName(word);
  final path = '$toRepositoryRoot$_rawWordsRoot/$nesting/$name';
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
