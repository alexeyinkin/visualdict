import 'package:dart_openai/dart_openai.dart';

import '../constants/openai.dart';
import '../util/openai.dart';
import 'text.dart';

class ChatGpt4Service extends TextAiService {
  @override
  Future<String> request(String prompt) async {
    final message = OpenAIChatCompletionChoiceMessageModel(
      role: OpenAIChatMessageRole.user,
      content: prompt,
    );

    final response = await OpenAI.instance.chat.create(
      model: OpenAiModels.gpt4,
      messages: [message],
    );

    final content = response.choices.first.message.content.trim();
    return content;
  }

  static void init(String toRoot) {
    initOpenAiKey(toRoot);
  }
}
