import 'package:args/args.dart';

class WordCreatePronunciationArgs {
  final bool generate;
  final String? split;

  const WordCreatePronunciationArgs({
    required this.generate,
    required this.split,
  });

  static WordCreatePronunciationArgs parse(List<String> args) {
    final parser = ArgParser();
    parser.addFlag('generate');
    parser.addOption('split');
    final result = parser.parse(args);

    return WordCreatePronunciationArgs(
      generate: result['generate'],
      split: result['split'],
    );
  }
}
