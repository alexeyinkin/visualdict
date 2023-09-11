import 'dart:collection';

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> sortedRecursive() {
    Object? _process(Object? value) {
      return switch (value) {
        Map<String, dynamic>() => value.sortedRecursive(),
        List() => value.map(_process).toList(growable: false),
        _ => value,
      };
    }

    final result = SplayTreeMap<String, dynamic>();

    for (final entry in entries) {
      result[entry.key] = _process(entry.value);
    }

    return result;
  }
}
