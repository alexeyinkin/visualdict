import 'dart:io';
import 'dart:math';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:model_fetch_firestore_json_files/model_fetch_firestore_json_files.dart';
import 'package:path/path.dart';

import '../constants/paths.dart';

class WordPublicFirestoreJsonFilesLoaderFactory
    extends AbstractFirestoreJsonFilesLoaderFactory<
        WordPublic,
        WordPublicFilter
        //
        > with LoaderFactoryMixin {
  static final _dir =
      '$toRepositoryRoot/$repositoryRootToFirestoreDataRoot/${CollectionsEnum.WordPublic.name}';

  final _reTail = r'\.json$';

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

    if (!Directory(dir).existsSync()) {
      final current = Directory.current;
      final files = current.listSync();
      final preview =
          files.sublist(0, min(files.length, 7)).map((e) => basename(e.path));

      throw Exception(
        'Directory not exists: $dir.\n'
        'Current directory: $current\n'
        'with: ${preview.join(', ')}\n'
        'Check if you run the editor from the frontend_editor directory',
      );
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
