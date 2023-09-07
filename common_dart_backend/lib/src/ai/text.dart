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
