import 'package:common_dart/common_dart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model_interfaces/model_interfaces.dart';

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

  @JsonKey(defaultValue: true)
  final bool isVisible;

  final List<PartOfSpeechSenses> partOfSpeechSenses;

  @JsonKey(includeIfNull: false)
  final Pronunciation? pronunciation;

  @JsonKey(includeIfNull: false)
  final String? transcription;

  const WordPublic({
    required this.comment,
    required this.id,
    required this.image,
    required this.isVisible,
    required this.partOfSpeechSenses,
    required this.pronunciation,
    required this.transcription,
  });

  factory WordPublic.fromJson(Map<String, dynamic> json) =>
      _$WordPublicFromJson(json);

  Map<String, dynamic> toJson() => _$WordPublicToJson(this);

  static Map<String, dynamic> filterFields(Map<String, dynamic> map) {
    final result = <String, dynamic>{};

    for (final entry in map.entries) {
      final key = entry.key;
      final value = entry.value;

      switch (key) {
        case 'comment':
        case 'complexDefinition':
          if (value == '') {
            continue;
          }

        case 'isVisible':
          if (value == true) {
            continue;
          }
      }

      result[key] = _filterField(value);
    }

    return result;
  }

  static dynamic _filterField(dynamic value) {
    return switch (value) {
      Map<String, dynamic>() => filterFields(value),
      List() => value.map(_filterField).toList(growable: false),
      _ => value,
    };
  }
}
