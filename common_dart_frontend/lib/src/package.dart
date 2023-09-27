import 'package:easy_localization_yaml/easy_localization_yaml.dart';

abstract final class CommonDartFrontend {
  static const packageName = 'common_dart_frontend';

  static const easyLocalizationLoader = YamlAssetLoader(
    directory: 'assets/translations',
    package: packageName,
  );
}
