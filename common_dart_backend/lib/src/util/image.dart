import 'package:common_dart/common_dart.dart';
import 'package:http/http.dart' as http;

import 'paths.dart';
import 'save_from_raw.dart';

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

Future<void> saveImageFromUrl({
  required Uri imageUrl,
  required WordPublic wordPublic,
  required String toRepositoryRoot,
}) async {
  await _saveRawImage(
    imageUrl: imageUrl.toString(),
    wordPublic: wordPublic,
    toRepositoryRoot: toRepositoryRoot,
  );

  await saveFromRaw(
    wordPublic.id,
    public: true,
    toRepositoryRoot: toRepositoryRoot,
  );
}
