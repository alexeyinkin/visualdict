import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/repository_engine.dart';

Future<void> initializeAnalytics() async {
  switch (RepositoryEngineEnum.current) {
    case RepositoryEngineEnum.flutterFire:
      FirebaseAnalytics.instance;

    case RepositoryEngineEnum.terraformJson:
      break;
  }
}
