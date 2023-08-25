import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';

@JsonSerializable(explicitToJson: true)
class Translation {
  final bool isLocked;
  final String value;

  const Translation({
    this.isLocked = false,
    required this.value,
  });

  factory Translation.fromJson(Map<String, dynamic> map) =>
      _$TranslationFromJson(map);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
