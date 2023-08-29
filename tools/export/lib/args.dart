import 'package:args/args.dart';

class WordExportArgs {
  final String lang;
  final String word;

  const WordExportArgs({
    required this.lang,
    required this.word,
  });

  static WordExportArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addOption('lang', mandatory: true);
    final result = parser.parse(args);

    return WordExportArgs(
      lang: result['lang'],
      //
      word: result.rest[0],
    );
  }
}
