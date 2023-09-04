import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:dart_openai/dart_openai.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, toRepositoryRoot: _toRoot);

  final posSenses = await getDefinitions(args);
  final grouped = PartOfSpeechSenses.groupByPos(posSenses);
  map['partOfSpeechSenses'] =
      grouped.map((o) => o.toJson()).toList(growable: false);
  writeWordPublicMap(args.word, map, toRepositoryRoot: _toRoot);
}

Future<List<PartOfSpeechSenses>> getDefinitions(WordArgs args) async {
  final (complexDefinitions, definitions) = args.mock
      ? getDefinitionsContentMock(args.word)
      : await getDefinitionsContent(args.word);

  final result = <PartOfSpeechSenses>[];
  final complexLines = complexDefinitions.split('\n');
  final lines = definitions.split('\n');
  final re = RegExp(r'^([ a-z]+): (.*)$');

  for (int i = 0; i < complexLines.length; i++) {
    final complexLine = complexLines[i];
    final line = lines[i];

    if (line == '') continue;

    final complexMatch = re.firstMatch(complexLine);
    if (complexMatch == null) {
      throw Exception('Cannot parse: ┤$complexLine├');
    }

    final match = re.firstMatch(line);
    if (match == null) {
      throw Exception('Cannot parse: ┤$line├');
    }

    final pos = parsePos(match[1]!);
    final complexDefinition = complexMatch[2]!;
    final definition = match[2]!;

    if (pos != null) {
      result.add(
        PartOfSpeechSenses(
          partOfSpeech: pos,
          senses: [
            Sense(
              complexDefinition: complexDefinition,
              definition: definition,
              definitionTranslations: {},
              usages: [],
            ),
          ],
        ),
      );
    }
  }

  return result;
}

(String, String) getDefinitionsContentMock(String word) {
  // Word: train
  final response = '''
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
  return (response, response);
}

Future<(String, String)> getDefinitionsContent(String word) async {
  final definitionsRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: '''
List all definitions of the word "$word".
Each definition should be in a dictionary style, not including the word itself.
For each one, show the part of speech.
Put each one in a single sentence on a separate paragraph
formatted as: part of speech in lowercase, colon, space, the definition sentence ending with a period.
No usage examples.
Order them from the most common to the least common.
Use a single newline character to separate paragraphs.
Answer with only this list and nothing more.''',
  );

  final definitionsResponse = await OpenAI.instance.chat.create(
    model: OpenAiModels.gpt4,
    messages: [definitionsRequestMessage],
  );
  final complexResult =
      definitionsResponse.choices.first.message.content.trim();
  print('Original:');
  print(complexResult);
  print('');

  final definitionsResponseMessage = definitionsResponse.choices.first.message;
  final simplifyRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: '''
Simplify the definitions while keeping the format,
the count, and the order.''',
  );

  final simplifyResponse = await OpenAI.instance.chat.create(
    model: 'gpt-4',
    messages: [
      definitionsRequestMessage,
      definitionsResponseMessage,
      simplifyRequestMessage,
    ],
  );
  final result = simplifyResponse.choices.first.message.content.trim();
  print('Simplified:');
  print(result);
  print('');

  return (complexResult, result);
}

PartOfSpeechEnum? parsePos(String pos) {
  switch (pos) {
    case 'possessive adjective':
      return PartOfSpeechEnum.adjective;

    case 'interrogative adverb':
      return PartOfSpeechEnum.adverb;

    case 'definite article':
    case 'determiner':
    case 'indefinite article':
      return PartOfSpeechEnum.article;

    case 'exclamation':
      return PartOfSpeechEnum.conjunction;

    case 'infinite marker':
    case 'infinitive marker':
    case 'suffix':
      return PartOfSpeechEnum.particle;

    case 'demonstrative pronoun':
    case 'interrogative pronoun':
    case 'possessive pronoun':
    case 'relative pronoun':
      return PartOfSpeechEnum.pronoun;

    case 'auxiliary verb':
    case 'modal verb':
      return PartOfSpeechEnum.verb;

    case 'abbreviation':
    case 'internet slang':
    case 'letter':
    case 'mathematical operator':
    case 'music':
    case 'music notation':
    case 'musical note':
    case 'prefix':
    case 'proper noun':
    case 'slang':
    case 'symbol':
      return null;
  }

  return PartOfSpeechEnum.values.byName(pos);
}
