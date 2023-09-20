import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/repository_engine.dart';

Future<void> initializeAnalytics() async {
  switch (RepositoryEngineEnum.current) {
    case RepositoryEngineEnum.flutterFire:
      unawaited(FirebaseAnalytics.instance.logEvent(name: 'my_load'));

    case RepositoryEngineEnum.terraformJson:
      break;
  }
}
