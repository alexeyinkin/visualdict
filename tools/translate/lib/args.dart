import 'package:args/args.dart';

class WordTranslateArgs {
  final bool force;
  final String lang;
  final bool mock;
  final String word;

  const WordTranslateArgs({
    required this.force,
    required this.lang,
    required this.mock,
    required this.word,
  });

  static WordTranslateArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addFlag('force');
    parser.addFlag('mock');
    parser.addOption('lang', mandatory: true);
    final result = parser.parse(args);

    return WordTranslateArgs(
      force: result['force'],
      mock: result['mock'],
      lang: result['lang'],
      //
      word: result.rest[0],
    );
  }
}
