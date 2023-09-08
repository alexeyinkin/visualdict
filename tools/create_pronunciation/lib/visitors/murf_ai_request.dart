import 'package:create_pronunciation/tokens.dart';

/// Converts a map to [MurfAiManualRequest].
class MurfAiRequestVisitor extends PronunciationTokenVisitor {
  final request = MurfAiRequest(textsByLang: {});

  @override
  Future<void> visitDefinitionToken(DefinitionToken token) async {
    request.addText(token.lang, token.definition);
  }

  @override
  Future<void> visitUsageToken(UsageToken token) async {
    request.addText(token.lang, token.usage.replaceAll('**', ''));
  }

  @override
  Future<void> visitWordToken(WordToken token) async {
    request.addText(token.lang, token.word);
  }
}

class MurfAiRequest {
  /// Pieces of text, each to be turned into a file.
  final Map<String, List<String>> textsByLang;

  const MurfAiRequest({
    required this.textsByLang,
  });

  void addText(String lang, String text) {
    if (!textsByLang.containsKey(lang)) {
      textsByLang[lang] = [text];
    } else {
      textsByLang[lang]!.add(text);
    }
  }
}

MurfAiManualRequest requestToManualRequest(MurfAiRequest request) {
  const maxCharacters = 100;
  const separator = '[pause 4.0s]';

  final linesByLang = <String, List<String>>{};
  final accumulators = <String, StringBuffer>{};

  void submitBuffer(String lang) {
    final buffer = accumulators[lang]!;

    if (!linesByLang.containsKey(lang)) {
      linesByLang[lang] = [buffer.toString()];
    } else {
      linesByLang[lang]!.add(buffer.toString());
    }
  }

  void addText(String lang, String text) {
    final write = '$text$separator';
    if (!accumulators.containsKey(lang)) {
      accumulators[lang] = StringBuffer(write);
    } else {
      final buffer = accumulators[lang]!;
      if (buffer.length + write.length <= maxCharacters) {
        buffer.write(write);
      } else {
        submitBuffer(lang);
        accumulators[lang] = StringBuffer(write);
      }
    }
  }

  for (final entry in request.textsByLang.entries) {
    final lang = entry.key;
    for (final text in entry.value) {
      addText(lang, text);
    }
  }

  for (final lang in accumulators.keys) {
    submitBuffer(lang);
  }

  return MurfAiManualRequest(linesByLang: linesByLang);
}

/// A "request" to Murf.ai to be manually performed in the UI.
class MurfAiManualRequest {
  /// Lines of text as they should appear in the UI.
  /// Each line may be split to multiple files.
  final Map<String, List<String>> linesByLang;

  const MurfAiManualRequest({
    required this.linesByLang,
  });

  @override
  String toString() {
    const prefix = '[pause 0.1s]';
    final buffer = StringBuffer();

    for (final entry in linesByLang.entries) {
      final lang = entry.key;
      final line = entry.value;

      buffer.writeln('$lang:');
      buffer.writeln(prefix + line.join('\n'));
      buffer.writeln();
    }

    return buffer.toString();
  }
}
