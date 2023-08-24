import 'dart:io';

import 'package:common_dart/common_dart.dart';

const _root = 'terraform/modules/google/firestore/data';

File getWordPublicJsonFile(String word, {String prefix = '.'}) {
  return File('$prefix/$_root/${CollectionsEnum.WordPublic.name}/$word.json');
}

File getWordPublicTerraformFile(String word, {String prefix = '.'}) {
  return File('$prefix/$_root/${CollectionsEnum.WordPublic.name}/$word.tf');
}
