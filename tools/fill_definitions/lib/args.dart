import 'package:args/args.dart';

class Args {
  final String word;

  const Args({
    required this.word,
  });

  static Args parse(List<String> args) {
    final parser = ArgParser();
    final result = parser.parse(args);

    return Args(
      word: result.rest[0],
    );
  }
}
