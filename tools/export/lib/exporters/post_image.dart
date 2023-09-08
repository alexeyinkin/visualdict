import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import '../constants.dart';

const _jpegQuality = 90;

Future<void> exportPostImage({
  required String word,
}) async {
  final srcDir = getRawWordDir(word, toRepositoryRoot: toRoot);
  final exportWordDir = getExportWordDir(word, toRepositoryRoot: toRoot);

  final name = wordToFileName(word);
  final srcFile = File('${srcDir.path}/${name}.png');

  final result = await Process.run(
    'convert',
    [
      // Overlay the image and the grey bottom.
      srcFile.path,
      'assets/overlays/post-overlay.png',
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
