import 'dart:convert';

const _encoder = JsonEncoder.withIndent('  ');

String jsonEncodeFormatted(Object? obj) {
  return _encoder.convert(obj);
}
