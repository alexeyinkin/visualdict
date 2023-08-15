import 'package:json_annotation/json_annotation.dart';
import 'package:model_interfaces/model_interfaces.dart';

import 'sense.dart';

part 'word_public.g.dart';

@JsonSerializable(createToJson: false)
class WordPublic implements WithId<String> {
  @override
  final String id;

  final List<Sense> senses;

  const WordPublic({
    required this.id,
    required this.senses,
  });

  factory WordPublic.fromJson(Map<String, dynamic> json) => _$WordPublicFromJson(json);
}
