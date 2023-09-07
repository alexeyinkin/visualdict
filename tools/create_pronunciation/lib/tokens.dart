const _en = 'en';

abstract class PronunciationToken {
  final String lang;
  final String word;

  const PronunciationToken({
    required this.lang,
    required this.word,
  });

  Future<void> accept(PronunciationTokenVisitor visitor);
}

class DefinitionToken extends PronunciationToken {
  final String definition;

  const DefinitionToken({
    required super.lang,
    required super.word,
    required this.definition,
  });

  @override
  String toString() => '[$word def in $lang: $definition]';

  @override
  Future<void> accept(PronunciationTokenVisitor visitor) async {
    await visitor.visitDefinitionToken(this);
  }
}

class UsageToken extends PronunciationToken {
  final String usage;

  const UsageToken({
    required super.word,
    required this.usage,
  }) : super(lang: _en);

  @override
  String toString() => '[$word usage: $usage]';

  @override
  Future<void> accept(PronunciationTokenVisitor visitor) async {
    await visitor.visitUsageToken(this);
  }
}

class WordToken extends PronunciationToken {
  const WordToken({
    required super.word,
  }) : super(lang: _en);

  @override
  String toString() => '[$word]';

  @override
  Future<void> accept(PronunciationTokenVisitor visitor) async {
    await visitor.visitWordToken(this);
  }
}

abstract class PronunciationTokenVisitor {
  Future<void> visitTokens(
      Map<String, Iterable<PronunciationToken>> tokens) async {
    for (final tokens in tokens.values) {
      for (final token in tokens) {
        await token.accept(this);
      }
    }
  }

  Future<void> visitDefinitionToken(DefinitionToken token);
  Future<void> visitUsageToken(UsageToken token);
  Future<void> visitWordToken(WordToken token);
}
