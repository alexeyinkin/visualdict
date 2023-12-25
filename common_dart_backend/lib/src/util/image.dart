import 'package:common_dart/common_dart.dart';
import 'package:http/http.dart' as http;

import '../models/generated_image_metadata.dart';
import 'paths.dart';
import 'save_from_raw.dart';

Future<void> saveImageFromUrl({
  required GeneratedImageMetadata metadata,
  required Uri imageUrl,
  required String toRepositoryRoot,
  required WordPublic wordPublic,
}) async {
  await _saveRawImage(
    imageUrl: imageUrl.toString(),
    metadata: metadata,
    toRepositoryRoot: toRepositoryRoot,
    wordPublic: wordPublic,
  );

  await saveFromRaw(
    wordPublic.id,
    public: true,
    toRepositoryRoot: toRepositoryRoot,
  );
}

Future<void> _saveRawImage({
  required String imageUrl,
  required GeneratedImageMetadata metadata,
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

  await yaml.writeAsString('''
prompt: '${metadata.parentImagePrompt}'
jobId: ${metadata.upscaledImageJobId}
seed: ${metadata.parentImageSeed}
''');
}
