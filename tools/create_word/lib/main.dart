import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  final args = WordArgs.parse(rawArgs);

  final replacements = {
    '{word}': args.word,
  };

  final jsonFile = getWordPublicJsonFile(args.word, toRepositoryRoot: _toRoot);
  final jsonContent = replacePatterns(
    File('assets/${CollectionsEnum.WordPublic.name}.json.template')
        .readAsStringSync(),
    replacements,
  );
  jsonFile.writeAsStringSync(jsonContent);

  final tfFile = getWordPublicTerraformFile(args.word, toRepositoryRoot: _toRoot);
  final tfContent = replacePatterns(
    File('assets/${CollectionsEnum.WordPublic.name}.tf.template')
        .readAsStringSync(),
    replacements,
  );
  tfFile.writeAsStringSync(tfContent);
}
