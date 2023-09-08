import 'package:json_annotation/json_annotation.dart';

part 'word_raw.g.dart';

@JsonSerializable(createToJson: false)
class WordRaw {
  final String prompt;
  final String jobId;
  final int seed;

  @JsonKey(defaultValue: .0)
  final double verticalX;

  const WordRaw({
    required this.prompt,
    required this.jobId,
    required this.seed,
    required this.verticalX,
  });

  factory WordRaw.fromJson(Map<String, dynamic> json) =>
      _$WordRawFromJson(json);
}
