import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:model_fetch_firestore_json_files/model_fetch_firestore_json_files.dart';

import '../filters/word_public.dart';
import '../models/word_public.dart';
import 'mixin.dart';

// TODO: Local path
const _dir = '/home/alexey/work/visualdict/terraform/modules/google/firestore/data/WordPublic';

class WordPublicFirestoreJsonFilesLoaderFactory
    extends AbstractFirestoreJsonFilesLoaderFactory<WordPublic,
        WordPublicFilter> with LoaderFactoryMixin {
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
