import 'package:common_dart/common_dart.dart';

abstract class TextAiService {
  Future<List<String>> getWordUsage(
    String word, {
    required PartOfSpeechEnum pos,
    required String definition,
    String involving = '',
    int count = 1,
  }) {
    const maxWordCount = 10;
    const stopList = [
      'climate change',
      'non-traditional gender identity',
      'socialism',
    ];

    final String countString;
    final String paragraphs;

    if (count == 1) {
      countString = '1 usage example';
      paragraphs =
          'Answer with only a single unquoted sentence and nothing more';
    } else {
      countString = '$count usage examples';
      paragraphs =
          'Put each example on a separate unquoted paragraph. Answer with only the list of paragraphs and nothing more';
    }

    final involvingPrompt = involving == '' ? '' : 'involving "$involving"';
    final prompt = '''
Give $countString for the word "$word" as ${pos.name}
in the sense of "$definition"
$involvingPrompt
in no more than $maxWordCount words.
Avoid examples that involve ${stopList.join(', ')}.
Put two asterisks to the left and to the right of the word.
$paragraphs''';

    return requestParagraphs(prompt);
  }

  Future<List<String>> getImageGenerationPrompts(String word) async {
    final prompt = '''
I will ask you to generate textual prompts to a neural network that generates images. When generating the prompts, keep in mind that:
1. The network is very poor in understanding relationships between words. It just gives highest value to words in the beginning and progressively less value to each next word.
2. Stick to things that can be pictured, with more focus on composition and less on actions. If anything cannot be recognized by a simple image recognizer, it should not be given as a prompt.
3. The network cannot tint actions with emotions or adjectives, so do not use anything like "someone is doing something in such a way".

Imagine a scene based on the word "$word". Generate prompts for it.
''';

    return requestParagraphs(prompt);
  }

  Future<String> request(String prompt);

  Future<List<String>> requestParagraphs(String prompt) async {
    final response = await request(prompt);
    return _split(response);
  }

  List<String> _split(String str) {
    final result = <String>[];
    final lines = str.split('\n').map((line) => line.trim());

    for (final line in lines) {
      if (line == '') continue;

      result.add(line);
    }

    return result;
  }
}
