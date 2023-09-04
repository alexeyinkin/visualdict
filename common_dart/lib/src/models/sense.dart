import 'package:json_annotation/json_annotation.dart';

import 'translation.dart';
import 'usage.dart';

part 'sense.g.dart';

@JsonSerializable(explicitToJson: true)
class Sense {
  @JsonKey(defaultValue: '')
  final String comment;

  @JsonKey(defaultValue: '')
  final String complexDefinition;

  final String definition;
  final Map<String, Translation> definitionTranslations;

  @JsonKey(defaultValue: true)
  final bool isVisible;

  final List<Usage> usages;

  const Sense({
    required this.comment,
    required this.complexDefinition,
    required this.definition,
    required this.definitionTranslations,
    required this.isVisible,
    required this.usages,
  });

  factory Sense.fromJson(Map<String, dynamic> json) => _$SenseFromJson(json);

  Map<String, dynamic> toJson() => _$SenseToJson(this);
}
