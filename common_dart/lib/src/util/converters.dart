DateTime? yyyyMmDdToUtcDateTime(Object? obj) {
  if (obj is! String) {
    return null;
  }

  final local = DateTime.tryParse(obj);
  if (local == null) {
    return null;
  }

  return DateTime.utc(local.year, local.month, local.day);
}

String? dateTimeToYyyyMmDd(DateTime? dt) {
  if (dt == null) {
    return null;
  }

  return dt.toIso8601String().substring(0, 'YYYY-MM-DD'.length);
}
