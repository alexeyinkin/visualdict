import 'dart:io';

import 'package:common_dart/common_dart.dart';

import 'firestore.dart';

const _root = 'terraform/modules/google/firestore/data';

Map<String, dynamic> getWordPublicMap(
    String word, {
      String prefix = '.',
    }) {
  final file = getWordPublicJsonFile(word, prefix: prefix);
  final content = file.readAsStringSync();
  return jsonDecodeFirestoreFormatted(content);
}

void writeWordPublicMap(
    String word, Map<String, dynamic> fields, {
      String prefix = '.',
    }) {
  final file = getWordPublicJsonFile(word, prefix: prefix);
  final content = jsonEncodeFirestoreFormatted(fields);
  file.writeAsStringSync(content);
}

File getWordPublicJsonFile(String word, {String prefix = '.'}) {
  return File('$prefix/$_root/${CollectionsEnum.WordPublic.name}/$word.json');
}

File getWordPublicTerraformFile(String word, {String prefix = '.'}) {
  return File('$prefix/$_root/${CollectionsEnum.WordPublic.name}/$word.tf');
}
