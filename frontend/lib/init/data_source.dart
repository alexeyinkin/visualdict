import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart'; // Generated.
import '../models/repository_engine.dart';

Future<void> initializeDataSource() async {
  switch (RepositoryEngineEnum.current) {
    case RepositoryEngineEnum.flutterFire:
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

    case RepositoryEngineEnum.terraformJson:
      break;
  }
}
