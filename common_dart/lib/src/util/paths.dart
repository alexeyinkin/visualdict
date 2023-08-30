const wordsDirLevels = 2;

String alphabeticNesting(String word) {
  final parts = <String>[];

  for (int i = 1; i <= wordsDirLevels; i++) {
    parts.add(i > word.length ? word : word.substring(0, i));
  }

  return parts.join('/');
}

String wordToFileName(String word) {
  return word.replaceAll(' ', '_');
}
