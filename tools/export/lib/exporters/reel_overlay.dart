import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import '../constants.dart';

Future<void> exportReelOverlay({
  required String lang,
  required Sense sense,
  required String word,
}) async {
  final exportWordDir = getExportWordDir(word, toRepositoryRoot: toRoot);
  final name = wordToFileName(word);

  final result = await Process.run(
    'convert',
    [
      // Global settings for all layers.
      '-font', font,
      '-fill', 'white',

      // Definitions first, before any background.
      // This is to allow "caption" to wrap lines in the given size.
      '-background', 'none',
      '-pointsize', '50',
      '-size', '1000x350',
      '-gravity', 'north',
      'caption:' + (sense.definitionTranslations[lang]?.text ?? 'NULL'),

      // Put the overlay in background ("swap").
      'assets/overlays/reel-overlay.png', '+swap',

      // Position the definitions.
      '-gravity', 'north',
      '-geometry', '+0+1556',
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
