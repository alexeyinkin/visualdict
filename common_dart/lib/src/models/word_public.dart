import 'package:json_annotation/json_annotation.dart';
import 'package:model_interfaces/model_interfaces.dart';

import '../util/converters.dart';
import 'image.dart';
import 'part_of_speech_senses.dart';
import 'pronunciation.dart';

part 'word_public.g.dart';

@JsonSerializable(explicitToJson: true)
class WordPublic implements WithId<String> {
  @JsonKey(defaultValue: '')
  final String comment;

  @override
  @JsonKey(includeToJson: false)
  final String id;

  @JsonKey(includeIfNull: false)
  final Image? image;

  @JsonKey(defaultValue: false)
  final bool isVisible;

  @JsonKey(defaultValue: [])
  final List<String> ngrams;

  @JsonKey(fromJson: yyyyMmDdToUtcDateTime, toJson: dateTimeToYyyyMmDd)
  final DateTime? ofTheDay;

  final List<PartOfSpeechSenses> partOfSpeechSenses;

  @JsonKey(includeIfNull: false)
  final Pronunciation? pronunciation;

  @JsonKey(defaultValue: '')
  final String transcription;

  const WordPublic({
    required this.comment,
    required this.id,
    required this.image,
    required this.isVisible,
    required this.ngrams,
    required this.ofTheDay,
    required this.partOfSpeechSenses,
    required this.pronunciation,
    required this.transcription,
  });

  factory WordPublic.fromJson(Map<String, dynamic> json) =>
      _$WordPublicFromJson(json);

  Map<String, dynamic> toJson() => _$WordPublicToJson(this);

  static Map<String, dynamic> filterFields(
    Map<String, dynamic> map, {
    bool dropIsVisibleTrue = false,
  }) {
    final result = <String, dynamic>{};

    for (final entry in map.entries) {
      final key = entry.key;
      final value = entry.value;

      switch (key) {
        case 'comment':
        case 'complexDefinition':
        case 'transcription':
          if (value == '') {
            continue;
          }

        case 'isHidden':
        case 'isLocked':
          if (value == false) {
            continue;
          }

        case 'isVisible':
          if (dropIsVisibleTrue && value == true) {
            continue;
          }
      }

      result[key] = _filterField(value);
    }

    return result;
  }

  static dynamic _filterField(dynamic value) {
    return switch (value) {
      Map<String, dynamic>() => filterFields(value, dropIsVisibleTrue: true),
      List() => value.map(_filterField).toList(growable: false),
      _ => value,
    };
  }
}
