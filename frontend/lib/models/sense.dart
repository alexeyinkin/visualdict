import 'package:json_annotation/json_annotation.dart';

import 'usage.dart';

part 'sense.g.dart';

@JsonSerializable(createToJson: false)
class Sense {
  final String definition;
  final Map<String, String> definitionTranslations;
  final List<Usage> usages;

  const Sense({
    required this.definition,
    required this.definitionTranslations,
    required this.usages,
  });

  factory Sense.fromJson(Map<String, dynamic> json) => _$SenseFromJson(json);
}
