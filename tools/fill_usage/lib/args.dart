import 'package:args/args.dart';

class WordUsageArgs {
  final int count;
  final bool force;
  final String involving;
  final bool mock;
  final String word;

  const WordUsageArgs({
    required this.count,
    required this.force,
    required this.involving,
    required this.mock,
    required this.word,
  });

  static WordUsageArgs parse(List<String> args) {
    final parser = ArgParser();

    parser.addOption('count', defaultsTo: '1');
    parser.addOption('involving', defaultsTo: '');
    parser.addFlag('force');
    parser.addFlag('mock');
    final result = parser.parse(args);

    return WordUsageArgs(
      count: int.parse(result['count']),
      force: result['force'],
      involving: result['involving'],
      mock: result['mock'],
      word: result.rest[0],
    );
  }
}
