import 'dart:convert';

import 'package:firestore_api_parser/firestore_api_parser.dart';

import 'firestore.dart';

const _encoder = JsonEncoder.withIndent('  ');

String jsonEncodeFormatted(Object? obj) {
  return _encoder.convert(obj);
}
