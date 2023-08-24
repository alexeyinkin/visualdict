import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  final args = Args.parse(rawArgs);

  final replacements = {
    '{word}': args.word,
  };

  final jsonFile = getWordPublicJsonFile(args.word, prefix: _toRoot);
  final jsonContent = _replacePatterns(
    File('assets/${CollectionsEnum.WordPublic.name}.json.template')
        .readAsStringSync(),
    replacements,
  );
  jsonFile.writeAsStringSync(jsonContent);

  final tfFile = getWordPublicTerraformFile(args.word, prefix: _toRoot);
  final tfContent = _replacePatterns(
    File('assets/${CollectionsEnum.WordPublic.name}.tf.template')
        .readAsStringSync(),
    replacements,
  );
  tfFile.writeAsStringSync(tfContent);
}

String _replacePatterns(String src, Map<Pattern, String> map) {
  for (final entry in map.entries) {
    src = src.replaceAll(entry.key, entry.value);
  }
  return src;
}
