import 'dart:convert';
import 'dart:io';

class Ffmpeg {
  static Future<Duration> getDuration(String path) async {
    final result = await Process.run(
      'ffprobe',
      [
        //
        '-loglevel', 'error',
        '-print_format', 'json',
        '-i', path,
        '-show_streams',
      ],
    );

    if (result.exitCode != 0) {
      print(result.stderr);
      throw Exception('Cannot get the audio duration: $path');
    }

    final map = jsonDecode(result.stdout);
    final seconds = double.parse(map['streams'][0]['duration']);
    return Duration(milliseconds: (seconds * 1000).floor());
  }
}
