import 'dart:io';

import 'package:dart_openai/dart_openai.dart';

void initOpenAiKey(String toRoot) {
  final key = File('$toRoot/keys/openai_key.txt').readAsStringSync();
  OpenAI.apiKey = key;
}
