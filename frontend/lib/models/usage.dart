import 'package:json_annotation/json_annotation.dart';

part 'usage.g.dart';

@JsonSerializable(createToJson: false)
class Usage {
  final String text;

  const Usage({
    required this.text,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}
