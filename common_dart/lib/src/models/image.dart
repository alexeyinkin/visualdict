import 'package:common_dart/common_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  final int timestamp;
  final String? hash;
  final String? prompt;

  const Image({
    required this.timestamp,
    required this.hash,
    required this.prompt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Uri getFullUrl(String word) {
    return Uri(
      scheme: 'https',
      host: 'static.visualdict.com',
      path: getPath(word: word),
    );
  }

  Uri getThumbUrl(String word) {
    return Uri(
      scheme: 'https',
      host: 'static.visualdict.com',
      path: getPath(word: word, size: Resolutions.thumb),
    );
  }

  String getPath({required String word, int? size}) {
    if (hash == null) {
      throw Exception('The image is not public.');
    }

    final sizePart = size == null ? '' : '-$size';
    return '/w/${alphabeticNesting(word)}/$word-$timestamp-hash$sizePart.jpg';
  }
}
