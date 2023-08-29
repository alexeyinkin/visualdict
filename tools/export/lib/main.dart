import 'dart:io';

import 'package:collection/collection.dart';
import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';

const _toRoot = '../..';
const _maxDefinitionsLength = 200;

Future<void> main(List<String> rawArgs) async {
  initOpenAiKey(_toRoot);
  final args = WordExportArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, prefix: _toRoot);

  final image = Image.fromJson(map['image']);
  final partOfSpeechSenses = (map['partOfSpeechSenses'] as Iterable)
          .map((map) => PartOfSpeechSenses.fromJson(map))
          .toList()
          .cast<PartOfSpeechSenses>();
  final transcription = map['transcription'];
  final lang = args.lang;
  final word = args.word;

  final pos1 = partOfSpeechSenses.first;
  final pos1sense1 = pos1.senses.first;
  final pos1sense2 = pos1.senses.elementAtOrNull(1);
  final pos1sense3 = pos1.senses.elementAtOrNull(2);

  final pos2 = partOfSpeechSenses.elementAtOrNull(1);
  final pos2sense1 = pos2?.senses.first;
  final pos2sense2 = pos2?.senses.elementAtOrNull(1);

  // Key is the priority for keeping.
  final options = {
    0: (pos1, pos1sense1),
    2: (pos1, pos1sense2),
    4: (pos1, pos1sense3),
    1: (pos2, pos2sense1),
    3: (pos2, pos2sense2),
  };

  options.removeWhere((k, record) {
    final (pos, sense) = record;
    return pos == null || sense == null;
  });

  // Remove items with least priority until we fit length.
  while (options.length > 1) {
    final length = options.values.fold(
      0,
      (n, record) => n + record.$2!.definition.length,
    );

    if (length <= _maxDefinitionsLength) {
      break;
    }

    final keys = [...options.keys];
    keys.sort();
    options.remove(keys.last);
  }

  final senses = options.values.map((record) => record.$2).cast<Sense>();
  final definitions = senses.map((s) => s.definitionTranslations[lang]?.value);
  final usages = senses.map((s) => s.usages).expand((usages) => usages);

  final exportWordDir = getExportWordDir(word, prefix: _toRoot);
  if (!exportWordDir.existsSync()) {
    exportWordDir.createSync(recursive: true);
  }

  final instagramText = '''
$word /$transcription/ — ${definitions.join(' ')}

${usages.map((u) => '💬 ${u.text.replaceAll('**', '')}').join('\n')}

🪄🖼️ ${image.prompt}
''';

  File(exportWordDir.path + '/$word-ig-$lang.txt')
      .writeAsStringSync(instagramText + '\n');

  final telegramText = '''
$instagramText
@word_of_the_day_rus
''';
  File(exportWordDir.path + '/$word-tg-$lang.txt')
      .writeAsStringSync(telegramText + '\n');
}
