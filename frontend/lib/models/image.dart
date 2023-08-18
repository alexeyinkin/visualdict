import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(createToJson: false)
class Image {
  final Uri url;
  final String? prompt;

  const Image({
    required this.url,
    required this.prompt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
