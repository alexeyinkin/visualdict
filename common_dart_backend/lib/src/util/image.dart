import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:http/http.dart' as http;

import 'paths.dart';

Future<void> _saveRawImage({
  required String imageUrl,
  required String toRepositoryRoot,
  required WordPublic wordPublic,
}) async {
  final response = await http.get(Uri.parse(imageUrl));

  final directory = getRawWordDir(
    wordPublic.id,
    toRepositoryRoot: toRepositoryRoot,
  );
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  final png = getWordPngFile(
    directory: directory,
    fileName: wordPublic.id,
  );
  final yaml = getWordYamlFile(
    directory: directory,
    fileName: wordPublic.id,
  );

  await png.writeAsBytes(response.bodyBytes);
  // TODO(nausharipov): fill metadata.
  await yaml.writeAsString('''
prompt: 'Rings inside a cut tree trunk showing age'
jobId: 'b22fbbcb-439d-4ad3-bd41-7de46647ccc3'
seed: 3163154358
''');
}

Future<void> saveImage({
  required String imageUrl,
  required WordPublic wordPublic,
  String toRepositoryRoot = '..',
}) async {
  await _saveRawImage(
    imageUrl: imageUrl,
    wordPublic: wordPublic,
    toRepositoryRoot: toRepositoryRoot,
  );

  // generates content in /static
  await Process.run('dart', [
    '../tools/set_image/lib/main.dart',
    wordPublic.id,
    '--toRoot',
    toRepositoryRoot,
    '--public',
  ]);
}
