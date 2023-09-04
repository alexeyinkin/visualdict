import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:model_fetch_firestore_json_files/model_fetch_firestore_json_files.dart';

import '../constants/paths.dart';
import '../filters/word_public.dart';
import 'mixin.dart';

class WordPublicFirestoreJsonFilesLoaderFactory
    extends AbstractFirestoreJsonFilesLoaderFactory<WordPublic,
        WordPublicFilter> with LoaderFactoryMixin {
  static final _dir =
      '$toRepositoryRoot/$repositoryRootToFirestoreDataRoot/${CollectionsEnum.WordPublic.name}';

  final re = RegExp(r'\.json$');

  @override
  FileIterableBuilder createFileIterableBuilder(WordPublicFilter filter) {
    return RecursiveFileIterableBuilder(
      directory: Directory(_dir),
      re: re,
    );
  }

  @override
  WordPublic fromMap(Map<String, dynamic> map) {
    return WordPublic.fromJson(map);
  }

  @override
  File idToFile(String id) {
    final name = wordToFileName(id);
    return File('$_dir/${alphabeticNesting(id)}/$name.json');
  }
}
