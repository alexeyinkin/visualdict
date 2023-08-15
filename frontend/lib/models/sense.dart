import 'package:json_annotation/json_annotation.dart';

import 'part_of_speech_enum.dart';

part 'sense.g.dart';

@JsonSerializable(createToJson: false)
class Sense {
  final String definition;
  final Map<String, String> definitionTranslations;
  final PartOfSpeechEnum partOfSpeech;

  const Sense({
    required this.definition,
    required this.definitionTranslations,
    required this.partOfSpeech,
  });

  factory Sense.fromJson(Map<String, dynamic> json) => _$SenseFromJson(json);
}
