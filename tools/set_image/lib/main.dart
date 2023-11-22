import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordImageArgs.parse(rawArgs);

  await saveFromRaw(
    args.word,
    public: args.public,
    toRepositoryRoot: _toRoot,
  );
}
