import 'package:args/args.dart';

class WordImageArgs {
  final bool public;
  final String word;

  const WordImageArgs({
    required this.public,
    required this.word,
  });

  static WordImageArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addFlag('public');
    final result = parser.parse(args);

    return WordImageArgs(
      public: result['public'],
      //
      word: result.rest[0],
    );
  }
}
