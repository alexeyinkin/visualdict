import 'package:json_annotation/json_annotation.dart';

import 'part_of_speech_enum.dart';
import 'sense.dart';

part 'part_of_speech_senses.g.dart';

@JsonSerializable(createToJson: false)
class PartOfSpeechSenses {
  final PartOfSpeechEnum partOfSpeech;
  final List<Sense> senses;

  const PartOfSpeechSenses({
    required this.partOfSpeech,
    required this.senses,
  });

  factory PartOfSpeechSenses.fromJson(Map<String, dynamic> json) =>
      _$PartOfSpeechSensesFromJson(json);
}
