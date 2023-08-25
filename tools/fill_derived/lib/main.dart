import 'package:common_dart_backend/common_dart_backend.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, prefix: _toRoot);

  map['ngrams'] = getNgrams(args.word);

  writeWordPublicMap(args.word, map, prefix: _toRoot);
}

List<String> getNgrams(String word) {
  return [
    word,
    for (int i = word.length; --i >= 1;) word.substring(0, i),
  ];
}
