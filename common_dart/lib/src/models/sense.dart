import 'package:json_annotation/json_annotation.dart';

import 'translation.dart';
import 'usage.dart';

part 'sense.g.dart';

@JsonSerializable(explicitToJson: true)
class Sense {
  final String? complexDefinition;
  final String definition;
  final Map<String, Translation> definitionTranslations;
  final List<Usage> usages;

  const Sense({
    required this.definition,
    required this.definitionTranslations,
    required this.usages,
    this.complexDefinition, // TODO: Required.
  });

  factory Sense.fromJson(Map<String, dynamic> json) => _$SenseFromJson(json);

  Map<String, dynamic> toJson() => _$SenseToJson(this);
}
