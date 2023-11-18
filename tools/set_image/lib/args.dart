import 'package:args/args.dart';

class WordImageArgs {
  final bool public;
  final String toRoot;
  final String word;

  const WordImageArgs({
    required this.public,
    required this.toRoot,
    required this.word,
  });

  static WordImageArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addFlag('public');
    parser.addOption(
      'toRoot',
      defaultsTo: '../..',
    );
    final result = parser.parse(args);

    return WordImageArgs(
      public: result['public'],
      toRoot: result['toRoot'],
      //
      word: result.rest[0],
    );
  }
}
