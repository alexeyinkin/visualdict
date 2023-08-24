import 'package:common_dart/common_dart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model_interfaces/model_interfaces.dart';

import 'image.dart';

part 'word_public.g.dart';

@JsonSerializable(createToJson: false)
class WordPublic implements WithId<String> {
  @override
  final String id;

  final Image? image;
  final Uri? pronunciationUrl;
  final List<PartOfSpeechSenses> partOfSpeechSenses;
  final String transcription;

  const WordPublic({
    required this.id,
    required this.image,
    required this.pronunciationUrl,
    required this.partOfSpeechSenses,
    required this.transcription,
  });

  factory WordPublic.fromJson(Map<String, dynamic> json) =>
      _$WordPublicFromJson(json);
}
