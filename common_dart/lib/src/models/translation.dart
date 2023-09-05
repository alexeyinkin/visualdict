import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';

@JsonSerializable(explicitToJson: true)
class Translation {
  @JsonKey(defaultValue: false)
  final bool isLocked;

  final String text;

  const Translation({
    required this.isLocked,
    required this.text,
  });

  factory Translation.fromJson(Map<String, dynamic> map) =>
      _$TranslationFromJson(map);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
