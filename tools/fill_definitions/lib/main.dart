import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:dart_openai/dart_openai.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, prefix: _toRoot);

  final posSenses = await getDefinitions(args);
  final grouped = PartOfSpeechSenses.groupByPos(posSenses);
  map['partOfSpeechSenses'] =
      grouped.map((o) => o.toJson()).toList(growable: false);
  writeWordPublicMap(args.word, map, prefix: _toRoot);
}

Future<List<PartOfSpeechSenses>> getDefinitions(WordArgs args) async {
  final definitionsContent = args.mock
      ? await getDefinitionsContentMock(args.word)
      : await getDefinitionsContent(args.word);

  final result = <PartOfSpeechSenses>[];
  final lines = definitionsContent.split('\n');
  final re = RegExp(r'^([a-z]+): (.*)$');

  for (final line in lines) {
    if (line == '') continue;

    final match = re.firstMatch(line);
    if (match == null) {
      throw Exception('Cannot parse: ┤$line├');
    }

    final pos = parsePos(match[1]!);
    final definition = match[2]!;

    result.add(
      PartOfSpeechSenses(
        partOfSpeech: pos,
        senses: [
          Sense(
            definition: definition,
            definitionTranslations: {},
            usages: [],
          ),
        ],
      ),
    );
  }

  return result;
}

Future<String> getDefinitionsContentMock(String word) async {
  // Word: train
  return '''
noun: A sequence of railroad cars moved as a unit by a locomotive or by integral motors.
verb: To guide the growth of (a plant) usually by bending, pruning, and tying or by layering.
noun: A series of parts or elements that together constitute a system for producing a result.
verb: To instruct systematically especially by drills and exercises.
verb: To prepare mentally (specifically for a particular job role or skill).
verb: To cause to go or run on a certain course or in a certain direction.
noun: The action of practice or exercise aimed at imparting skill or proficiency.
noun: A procession of people or vehicles moving in the same direction.
verb: To target or focus on, as in athletic activities.
noun: A part of a dress or robe trailing behind the wearer.
noun: A retinue of attendants; a group of assistants to a notable person.
''';
}

Future<String> getDefinitionsContent(String word) async {
  final definitionsRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: '''
List all definitions of the word "$word".
Each definition should be in a dictionary style, not including the word itself.
For each one, show the part of speech.
Put each one in a single sentence on a separate paragraph
formatted as: part of speech in lowercase, colon, space, the definition sentence ending with a period.
Order them from the most common to the least common.
Use a single newline character to separate paragraphs.
Answer with only this list and nothing more.''',
  );

  final definitionsResponse = await OpenAI.instance.chat.create(
    model: OpenAiModels.gpt4,
    messages: [definitionsRequestMessage],
  );
  print('Original:');
  print(definitionsResponse.choices.first.message.content);
  print('');

  final definitionsResponseMessage = definitionsResponse.choices.first.message;
  final simplifyRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: 'Simplify the definitions while keeping the format.',
  );

  final simplifyResponse = await OpenAI.instance.chat.create(
    model: 'gpt-4',
    messages: [
      definitionsRequestMessage,
      definitionsResponseMessage,
      simplifyRequestMessage,
    ],
  );
  print('Simplified:');
  print(simplifyResponse.choices.first.message.content);
  print('');

  return simplifyResponse.choices.first.message.content;
}

PartOfSpeechEnum parsePos(String pos) {
  switch (pos) {
    case 'determiner':
      return PartOfSpeechEnum.article;
  }

  return PartOfSpeechEnum.values.byName(pos);
}
