import 'dart:io';

import 'package:common_dart/common_dart.dart';

import 'firestore.dart';

const repositoryRootToFirestoreDataRoot =
    'terraform/modules/google/firestore/data';

Map<String, dynamic> getWordPublicMap(
  String word, {
  String toRepositoryRoot = '.',
}) {
  final file = getWordPublicJsonFile(word, toRepositoryRoot: toRepositoryRoot);
  final content = file.readAsStringSync();
  return jsonDecodeFirestoreFormatted(content);
}

void writeWordPublicMap(
  String word,
  Map<String, dynamic> fields, {
  String toRepositoryRoot = '.',
}) {
  final file = getWordPublicJsonFile(word, toRepositoryRoot: toRepositoryRoot);
  final filteredFields = WordPublic.filterFields(fields).sortedRecursive();
  final content = jsonEncodeFirestoreFormatted(filteredFields);
  file.writeAsStringSync(content + '\n');
}

File getWordPublicJsonFile(String word, {String toRepositoryRoot = '.'}) {
  return File(
    '$toRepositoryRoot/$repositoryRootToFirestoreDataRoot/${CollectionsEnum.WordPublic.name}/${alphabeticNesting(word)}/$word.json',
  );
}

File getWordPublicTerraformFile(String word, {String toRepositoryRoot = '.'}) {
  return File(
    '$toRepositoryRoot/$repositoryRootToFirestoreDataRoot/${CollectionsEnum.WordPublic.name}/${alphabeticNesting(word)}/$word.tf',
  );
}
