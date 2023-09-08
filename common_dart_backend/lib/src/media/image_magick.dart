import 'dart:io';

class ImageMagick {
  static Future<(int, int)> dimensions(String path) async {
    final result = await Process.run(
      'identify',
      [
        //
        '-format', '%w %h',
        path,
      ],
    );

    if (result.exitCode != 0) {
      print(result.stderr);
      throw Exception(result);
    }

    final output = result.stdout as String;
    final re = RegExp(r'^(\d+) (\d+)$');
    final match = re.firstMatch(output);

    if (match == null) {
      throw Exception('Cannot parse ImageMagick dimensions output: $output');
    }

    return (int.parse(match[1]!), int.parse(match[2]!));
  }
}
