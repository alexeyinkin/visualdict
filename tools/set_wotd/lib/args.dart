import 'package:args/args.dart';

class WordDateArgs {
  final DateTime? date;
  final String word;

  const WordDateArgs({
    required this.word,
    this.date,
  });

  static WordDateArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addOption('date');
    final result = parser.parse(args);

    return WordDateArgs(
      date: DateTime.tryParse(result['date'] ?? ''),
      //
      word: result.rest[0],
    );
  }
}
