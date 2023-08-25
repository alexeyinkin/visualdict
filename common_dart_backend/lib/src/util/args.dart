import 'package:args/args.dart';

class WordArgs {
  final bool force;
  final bool mock;
  final String word;

  const WordArgs({
    required this.force,
    required this.mock,
    required this.word,
  });

  static WordArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addFlag('force');
    parser.addFlag('mock');
    final result = parser.parse(args);

    return WordArgs(
      force: result['force'],
      mock: result['mock'],
      word: result.rest[0],
    );
  }
}
