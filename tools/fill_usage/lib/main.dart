import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:retry/retry.dart';

import 'args.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  ChatGpt4Service.init(_toRoot);
  final args = WordUsageArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, toRepositoryRoot: _toRoot);
  final posSensesList = map['partOfSpeechSenses'];

  if (posSensesList is! List) {
    throw Exception(
      'Run `fill_definitions` first to initialize `partOfSpeechSenses`',
    );
  }

  final newPosSenses = <Map<String, dynamic>>[];

  for (final posSensesMap in posSensesList) {
    final posSenses = PartOfSpeechSenses.fromJson(posSensesMap);

    for (final sense in posSenses.senses) {
      if (sense.usages.isNotEmpty && !args.force) {
        print(
          'Skipping existing usage for '
          '${posSenses.partOfSpeech.name}: ${sense.definition}',
        );
        continue;
      }

      final List<String> texts;

      if (args.mock) {
        texts = getUsageMocks(args.word);
      } else {
        texts = await retry(
          () => ChatGpt4Service().getWordUsage(
            args.word,
            pos: posSenses.partOfSpeech,
            definition: sense.definition,
            count: args.count,
            involving: args.involving,
          ),
          maxAttempts: 3,
        );

        print('${posSenses.partOfSpeech.name}: ${sense.definition}');
        print(texts.join('\n'));
        print('');
      }

      sense.usages.clear();

      for (final text in texts) {
        sense.usages.add(
          Usage(
            comment: '',
            isVisible: true,
            text: text,
          ),
        );
      }
    }

    newPosSenses.add(posSenses.toJson());
  }

  map['partOfSpeechSenses'] = newPosSenses;
  writeWordPublicMap(args.word, map, toRepositoryRoot: _toRoot);
}

List<String> getUsageMocks(String word) {
  return ['Usage mock for **$word**.'];
}
