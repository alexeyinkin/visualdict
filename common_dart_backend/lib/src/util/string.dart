String replacePatterns(String src, Map<Pattern, String> map) {
  for (final entry in map.entries) {
    src = src.replaceAll(entry.key, entry.value);
  }
  return src;
}
