import 'dart:io';

Future<void> openUrlOnDesktop(String url) async {
  if (Platform.isMacOS) {
    await Process.run('open', [url]);
  } else if (Platform.isWindows) {
    await Process.run('start', [url]);
  } else {
    throw Exception('Unsupported platform');
  }
}
