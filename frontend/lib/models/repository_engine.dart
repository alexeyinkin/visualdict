import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

enum RepositoryEngineEnum {
  flutterFire,
  terraformJson,
  ;

  static RepositoryEngineEnum get current {
    if (kIsWeb) {
      return RepositoryEngineEnum.flutterFire;
    }

    if (Platform.isAndroid) {
      return RepositoryEngineEnum.flutterFire;
    }

    if (Platform.isIOS) {
      return RepositoryEngineEnum.flutterFire;
    }

    if (Platform.isMacOS) {
      return RepositoryEngineEnum.flutterFire;
    }

    return RepositoryEngineEnum.terraformJson;
  }
}
