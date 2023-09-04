import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:dart_openai/dart_openai.dart';

const _toRoot = '../..';
const _maxWordCount = 10;
const _stopList = [
  'climate change',
  'non-traditional gender identity',
  'socialism',
];

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordArgs.parse(rawArgs);

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

      sense.usages.clear();
      sense.usages.add(
        Usage(
          text: args.mock
              ? getUsageMock(args.word)
              : await getUsage(
                  args.word,
                  pos: posSenses.partOfSpeech,
                  definition: sense.definition,
                ),
        ),
      );
    }

    newPosSenses.add(posSenses.toJson());
  }

  map['partOfSpeechSenses'] = newPosSenses;
  writeWordPublicMap(args.word, map, toRepositoryRoot: _toRoot);
}

String getUsageMock(String word) {
  return 'Usage mock for **$word**.';
}

Future<String> getUsage(
  String word, {
  required PartOfSpeechEnum pos,
  required String definition,
}) async {
  final definitionsRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: '''
Give a usage example for the word "$word" as ${pos.name}
in the sense of "$definition"
in no more than $_maxWordCount words.
Avoid examples that involve ${_stopList.join(', ')}.
Put two asterisks to the left and to the right of the word.
Answer with only a single unquoted sentence and nothing more.''',
  );

  final response = await OpenAI.instance.chat.create(
    model: OpenAiModels.gpt4,
    messages: [definitionsRequestMessage],
  );
  final content = response.choices.first.message.content.trim();
  print('${pos.name}: $definition:');
  print(content);
  print('');

  return content;
}
