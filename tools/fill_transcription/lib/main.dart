import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:retry/retry.dart';

const _toRoot = '../..';

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, toRepositoryRoot: _toRoot);

  map['transcription'] = args.mock
      ? getTranscriptionMock(args.word)
      : await retry(
          () => getTranscription(args.word),
          maxAttempts: 3,
        );

  writeWordPublicMap(args.word, map, toRepositoryRoot: _toRoot);
}

String getTranscriptionMock(String word) {
  return 'tɹeɪn';
}

Future<String> getTranscription(String word) async {
  final definitionsRequestMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: '''
Give the transcription for the word "$word" in abstract phonemic notation.
Answer with only the transcription and nothing more.''',
  );

  final response = await OpenAI.instance.chat.create(
    model: OpenAiModels.gpt35turbo,
    messages: [definitionsRequestMessage],
  );
  final content = response.choices.first.message.content;
  print('┤$content├');

  final re = RegExp(r'^/(.*)/$', multiLine: true);
  final match = re.firstMatch(content);

  if (match == null) {
    return content;
    //throw Exception('Cannot parse: ┤$content├');
  }
  return match[1]!;
}
