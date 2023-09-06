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

  final _reTail = r'\.json$';
  //final re = RegExp(r'\.json$');

  @override
  FileIterableBuilder createFileIterableBuilder(WordPublicFilter filter) {
    var dir = _dir;

    final search = filter.search ?? '';
    if (search != '') {
      final firstA = search.substring(0, 1);
      dir += '/$firstA';

      if (search.length > 1) {
        final first2A = search.substring(0, 2);
        dir += '/$first2A';
      }
    }

    return RecursiveFileIterableBuilder(
      directory: Directory(dir),
      re: RegExp('^' + RegExp.escape(search) + '.*' + _reTail),
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
