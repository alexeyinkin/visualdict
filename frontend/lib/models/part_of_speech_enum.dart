import 'package:json_annotation/json_annotation.dart';

//part 'part_of_speech_enum.g.dart';

//@JsonEnum(alwaysCreate: true)
enum PartOfSpeechEnum {
  adverb,
  article,
  conjunction,
  noun,
  participle,
  preposition,
  pronoun,
  verb,
  ;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
//  factory PartOfSpeechEnum.fromJson(Map<String, dynamic> json) => _$PartOfSpeechEnumFromJson(json);
}
