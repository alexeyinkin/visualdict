import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:flutter/foundation.dart';

import '../constants/paths.dart';

void initializeOpenAiBackend() {
  if (!kIsWeb) {
    ChatGpt4Service.init(toRepositoryRoot);
  }
}
