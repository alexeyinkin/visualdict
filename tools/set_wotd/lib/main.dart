import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordDateArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, prefix: _toRoot);
  final date = args.date ?? DateTime.now().toUtc();
  map['ofTheDay'] = date.toIso8601String().substring(0, 'YYYY-MM-DD'.length);

  writeWordPublicMap(args.word, map, prefix: _toRoot);
}
