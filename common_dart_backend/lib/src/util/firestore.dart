import 'dart:convert';

import 'package:firestore_api_parser/firestore_api_parser.dart';

const _encoder = JsonEncoder.withIndent('  ');

Map<String, dynamic> jsonDecodeFirestoreFormatted(String fieldsJson) {
  return FirestoreApiParser().parseFirestoreDocument(
    doc: {
      'fields': jsonDecode(fieldsJson),
    },
  );
}

String jsonEncodeFirestoreFormatted(Map<String, dynamic> fields) {
  return _encoder.convert(
    FirestoreApiParser().parseJson(json: fields)['fields'],
  );
}
