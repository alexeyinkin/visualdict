import 'package:json_annotation/json_annotation.dart';

part 'usage.g.dart';

@JsonSerializable(explicitToJson: true)
class Usage {
  @JsonKey(defaultValue: '')
  final String comment;

  @JsonKey(defaultValue: true)
  final bool isVisible;

  final String text;

  const Usage({
    required this.comment,
    required this.isVisible,
    required this.text,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}
