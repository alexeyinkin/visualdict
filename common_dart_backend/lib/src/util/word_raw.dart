import 'dart:convert';

import 'package:common_dart/common_dart.dart';
import 'package:yaml/yaml.dart';

import '../models/word_raw.dart';
import 'paths.dart';

WordRaw getWordRaw(String word, {required String toRepositoryRoot}) {
  final dir = getRawWordDir(word, toRepositoryRoot: toRepositoryRoot);
  final name = wordToFileName(word);

  final yaml = loadYaml(
    getWordYamlFile(
      directory: dir,
      fileName: name,
    ).readAsStringSync(),
  );
  final map = jsonDecode(jsonEncode(yaml));

  return WordRaw.fromJson(map);
}
