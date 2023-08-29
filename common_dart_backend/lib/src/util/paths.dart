import 'dart:io';

import 'package:common_dart/common_dart.dart';

const _rawWordsRoot = '/raw/words';
const _processedWordsRoot = '/static/w';
const _exportWordsRoot = '/export';

Directory getRawWordDir(String word, {String prefix = '.'}) {
  final nesting = alphabeticNesting(word);
  final path= '$prefix$_rawWordsRoot/$nesting/$word';
  return Directory(path);
}

Directory getProcessedWordDir(String word, {String prefix = '.'}) {
  final nesting = alphabeticNesting(word);
  final path= '$prefix$_processedWordsRoot/$nesting/$word';
  return Directory(path);
}

Directory getExportWordDir(String word, {String prefix = '.'}) {
  final path= '$prefix$_exportWordsRoot/$word';
  return Directory(path);
}
