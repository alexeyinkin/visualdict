import 'dart:io';

String getMjToken(String toRoot) {
  final file = File('$toRoot/keys/mj_token.txt');
  if (!file.existsSync()) {
    throw Exception('No Midjourney token');
  }
  return file.readAsStringSync();
}
