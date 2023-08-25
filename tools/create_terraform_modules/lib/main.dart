import 'dart:io';

import 'package:common_dart_backend/common_dart_backend.dart';

const _levels = 2;
const _terraformRoot =
    '../../terraform/modules/google/firestore/data/WordPublic';

final moduleTemplate = File('assets/modules.tf.template').readAsStringSync();
final variablesTemplate =
    File('assets/variables.tf.template').readAsStringSync();

void main() {
  _createModules([], 0);
}

void _createModules(List<String> parentDirs, int level) {
  final parentDirsJoined = parentDirs.map((d) => '/$d').join();
  final parentPath = '$_terraformRoot$parentDirsJoined';

  final parentName = parentDirs.lastOrNull ?? '';
  final moduleDefinitions = <String>[];

  final nameTails = [
    '',
    for (int code = 'a'.runes.first; code <= 'z'.runes.first; code++)
      String.fromCharCode(code),
  ];

  for (final nameTail in nameTails) {
    final name = parentName + nameTail;
    if (name == '') continue;

    final path = '$parentPath/$name';
    final dir = Directory(path);

    if (!dir.existsSync()) {
      dir.createSync();
    }

    if (level + 1 < _levels) {
      _createModules([...parentDirs, name], level + 1);
    } else {
      final variablesFile = File('$path/_variables.tf');
      variablesFile.writeAsStringSync(variablesTemplate);
    }

    moduleDefinitions.add(
      replacePatterns(
        moduleTemplate,
        {
          '{module}': name,
        },
      ),
    );
  }

  final modulesFile = File('$parentPath/modules.tf');
  modulesFile.writeAsStringSync(moduleDefinitions.join('\n'));

  final variablesFile = File('$parentPath/variables.tf');
  variablesFile.writeAsStringSync(variablesTemplate);
}
