import 'dart:io';

import 'package:collection/collection.dart';
import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';

const _toRoot = '../..';
const _maxDefinitionsLength = 200;
const _jpegQuality = 90;

// Downloaded from https://fonts.google.com/specimen/Fira+Sans+Extra+Condensed
const _font = 'assets/fonts/FiraSansExtraCondensed-Medium.ttf';

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

  await _exportTexts(
    image: image,
    lang: lang,
    partOfSpeechSenses: partOfSpeechSenses,
    transcription: transcription,
    word: word,
  );

  await _exportPostImage(word: word);
  await _exportReelBackground(word: word);

  await _exportReelOverlay(
    lang: lang,
    sense: partOfSpeechSenses.first.senses.first,
    word: word,
  );
}

Future<void> _exportTexts({
  required Image image,
  required String lang,
  required List<PartOfSpeechSenses> partOfSpeechSenses,
  required String transcription,
  required String word,
}) async {
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

Future<void> _exportPostImage({
  required String word,
}) async {
  final srcDir = getRawWordDir(word, prefix: _toRoot);
  final exportWordDir = getExportWordDir(word, prefix: _toRoot);

  final name = wordToFileName(word);
  final srcFile = File('${srcDir.path}/${name}.png');

  final result = await Process.run(
    'convert',
    [
      // Overlay the image and the grey bottom.
      srcFile.path,
      'assets/post-overlay.png',
      '-composite',

      // Global settings for all layers (if we add more than one).
      '-font', 'assets/fonts/FiraSansExtraCondensed-Medium.ttf',
      '-fill', 'white',

      // Put the word.
      '-pointsize', '98',
      '-gravity', 'center',
      '-annotate', '+0+441', word,

      // Export.
      '-quality', '$_jpegQuality',
      '${exportWordDir.path}/$name.jpeg',
    ],
  );

  if (result.exitCode != 0) {
    throw Exception(result);
  }
}

Future<void> _exportReelBackground({
  required String word,
}) async {
  final srcDir = getRawWordDir(word, prefix: _toRoot);
  final exportWordDir = getExportWordDir(word, prefix: _toRoot);

  final name = wordToFileName(word);
  final srcFiles = [
    File('${srcDir.path}/${name}-vertical.png'),
    File('${srcDir.path}/${name}.png'),
  ];

  for (final srcFile in srcFiles) {
    if (srcFile.existsSync()) {
      srcFile.copy('${exportWordDir.path}/$name-vertical.png');
      return;
    }
  }

  throw Exception('None of the candidate files exists: $srcFiles');
}

Future<void> _exportReelOverlay({
  required String lang,
  required Sense sense,
  required String word,
}) async {
  final exportWordDir = getExportWordDir(word, prefix: _toRoot);
  final name = wordToFileName(word);

  final result = await Process.run(
    'convert',
    [
      // Global settings for all layers.
      '-font', _font,
      '-fill', 'white',

      // Definitions first, before any background.
      // This is to allow "caption" to wrap lines in the given size.
      '-background', 'none',
      '-pointsize', '50',
      '-size', '1000x350',
      '-gravity', 'center',
      'caption:' + (sense.definitionTranslations[lang]?.value ?? 'NULL'),

      // Put the overlay in background ("swap").
      'assets/reel-overlay.png', '+swap',

      // Position the definitions.
      '-gravity', 'north',
      '-geometry', '+0+1412',
      '-composite',

      // Put the word.
      '-pointsize', '98',
      '-gravity', 'center',
      '-annotate', '+0+520', word,

      // Export.
      '${exportWordDir.path}/$name-bottom-$lang.png',
    ],
  );

  if (result.exitCode != 0) {
    throw Exception(result);
  }
}
