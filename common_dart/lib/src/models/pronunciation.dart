import 'package:json_annotation/json_annotation.dart';

import '../util/paths.dart';

part 'pronunciation.g.dart';

@JsonSerializable(explicitToJson: true)
class Pronunciation {
  final int timestamp;
  final String? hash;

  const Pronunciation({
    required this.timestamp,
    required this.hash,
  });

  factory Pronunciation.fromJson(Map<String, dynamic> json) =>
      _$PronunciationFromJson(json);

  Map<String, dynamic> toJson() => _$PronunciationToJson(this);

  Uri getUrl(String word) {
    return Uri(
      scheme: 'https',
      host: 'static.visualdict.com',
      path: getPath(word),
    );
  }

  String getPath(String word) {
    if (hash == null) {
      throw Exception('The image is not public.');
    }

    return '/w/${alphabeticNesting(word)}/$word/$word-$timestamp-$hash.mp3';
  }
}
