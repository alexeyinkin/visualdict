import 'dart:io';

import 'package:dart_openai/dart_openai.dart';

bool get hasOpenAiKey => _key != '';

String _key = '';

void initOpenAiKey(String toRoot) {
  final file = File('$toRoot/keys/openai_key.txt');

  if (!file.existsSync()) {
    print('Skipping OpenAI initialization, no API key.');
    return;
  }

  _key = file.readAsStringSync();
  OpenAI.apiKey = _key;
}
