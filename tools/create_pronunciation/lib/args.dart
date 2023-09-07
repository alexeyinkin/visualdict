import 'package:args/args.dart';

class WordCreatePronunciationArgs {
  final List<String> defLangs;
  final bool generate;
  final String? split;
  final bool usage;
  final bool word;

  const WordCreatePronunciationArgs({
    required this.defLangs,
    required this.generate,
    required this.split,
    required this.usage,
    required this.word,
  });

  static WordCreatePronunciationArgs parse(List<String> args) {
    final parser = ArgParser();

    parser.addFlag('generate');
    parser.addFlag('usage');
    parser.addFlag('word');

    parser.addOption('split');
    parser.addOption('def-langs', defaultsTo: '');

    final result = parser.parse(args);

    return WordCreatePronunciationArgs(
      defLangs: (result['def-langs'] as String)
          .split(',')
          .where((s) => s.isNotEmpty)
          .toList(growable: false),
      generate: result['generate'],
      split: result['split'],
      usage: result['usage'],
      word: result['word'],
    );
  }
}
