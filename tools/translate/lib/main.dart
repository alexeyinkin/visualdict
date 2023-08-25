import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:dart_openai/dart_openai.dart';

import 'args.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordTranslateArgs.parse(rawArgs);

  if (args.lang == LanguagesEnum.en.name) {
    throw Exception('Cannot translate to English because it is the original.');
  }

  final map = getWordPublicMap(args.word, prefix: _toRoot);
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
      final translation =
          sense.definitionTranslations[args.lang] ?? Translation(value: '');

      if (shouldPreserveTranslation(translation, args)) {
        print(
          'Skipping existing translation for '
          '${posSenses.partOfSpeech.name}: ${sense.definition}',
        );
        print(translation.value);
        continue;
      }

      final value = args.mock
          ? translateMock(args.word, args.lang)
          : await translate(
              word: args.word,
              lang: args.lang,
              pos: posSenses.partOfSpeech,
              definition: sense.definition,
            );
      sense.definitionTranslations[args.lang] = Translation(value: value);
    }

    newPosSenses.add(posSenses.toJson());
  }

  map['partOfSpeechSenses'] = newPosSenses;
  writeWordPublicMap(args.word, map, prefix: _toRoot);
}

bool shouldPreserveTranslation(
  Translation? translation,
  WordTranslateArgs args,
) {
  if (translation == null) {
    return false;
  }

  if (translation.value == '') {
    return false;
  }

  return !args.force;
}

String translateMock(String word, String lang) {
  return 'Mock translation of $word to $lang.';
}

Future<String> translate({
  required String word,
  required String lang,
  required PartOfSpeechEnum pos,
  required String definition,
}) async {
  final languageName = getLanguageName(lang);
  final definitionsRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: '''
Translate to $languageName: "$definition".
For context: this is a definition of the word "$word" as ${pos.name}.
Answer with only a single unquoted translated sentence and nothing more.''',
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

String getLanguageName(String lang) {
  return switch (lang) {
    'ru' => 'Russian',
    'en' => 'English',
    _ => (throw Exception('Unknown language: $lang')),
  };
}
