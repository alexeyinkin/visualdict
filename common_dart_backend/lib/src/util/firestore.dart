import 'dart:convert';

import 'package:firestore_api_converter/firestore_api_converter.dart';

const _encoder = JsonEncoder.withIndent('  ');

Map<String, dynamic> jsonDecodeFirestoreFormatted(String fieldsJson) {
  return FirestoreApiConverter.fromFirestore({
    'fields': jsonDecode(fieldsJson),
  });
}

String jsonEncodeFirestoreFormatted(Map<String, dynamic> fields) {
  return _encoder.convert(
    FirestoreApiConverter.toFirestore(fields)['fields'],
  );
}
