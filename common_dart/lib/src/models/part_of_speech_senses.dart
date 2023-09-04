import 'package:json_annotation/json_annotation.dart';

import 'part_of_speech_enum.dart';
import 'sense.dart';

part 'part_of_speech_senses.g.dart';

@JsonSerializable(explicitToJson: true)
class PartOfSpeechSenses {
  @JsonKey(defaultValue: '')
  final String comment;

  @JsonKey(defaultValue: true)
  final bool isVisible;

  final PartOfSpeechEnum partOfSpeech;
  final List<Sense> senses;

  const PartOfSpeechSenses({
    required this.comment,
    required this.isVisible,
    required this.partOfSpeech,
    required this.senses,
  });

  factory PartOfSpeechSenses.fromJson(Map<String, dynamic> json) =>
      _$PartOfSpeechSensesFromJson(json);

  Map<String, dynamic> toJson() => _$PartOfSpeechSensesToJson(this);

  static List<PartOfSpeechSenses> groupByPos(
    Iterable<PartOfSpeechSenses> list,
  ) {
    final result = <PartOfSpeechEnum, PartOfSpeechSenses>{};

    for (final one in list) {
      final pos = one.partOfSpeech;
      final existing = result[pos] ??
          PartOfSpeechSenses(
            comment: '',
            isVisible: true,
            partOfSpeech: pos,
            senses: [],
          );

      existing.senses.addAll(one.senses);
      result[pos] = existing;
    }

    return result.values.toList(growable: false);
  }
}
