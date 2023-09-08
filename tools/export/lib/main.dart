import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import 'args.dart';
import 'constants.dart';
import 'exporters/audio_word_silence.dart';
import 'exporters/post_image.dart';
import 'exporters/reel.dart';
import 'exporters/reel_audio.dart';
import 'exporters/reel_overlay.dart';
import 'exporters/texts.dart';

Future<void> main(List<String> rawArgs) async {
  final args = WordExportArgs.parse(rawArgs);

  final map = getWordPublicMap(args.word, toRepositoryRoot: toRoot);
  final wordRaw = getWordRaw(args.word, toRepositoryRoot: toRoot);

  final image = Image.fromJson(map['image']);
  final partOfSpeechSenses = (map['partOfSpeechSenses'] as Iterable)
      .map((map) => PartOfSpeechSenses.fromJson(map))
      .toList()
      .cast<PartOfSpeechSenses>();
  final transcription = map['transcription'];
  final lang = args.lang;
  final word = args.word;

  if (args.all || args.texts) {
    await exportTexts(
      image: image,
      lang: lang,
      partOfSpeechSenses: partOfSpeechSenses,
      transcription: transcription,
      word: word,
    );
  }

  if (args.all || args.postImage) {
    await exportPostImage(word: word);
  }

  if (args.all || args.reelOverlay) {
    await exportReelOverlay(
      lang: lang,
      sense: partOfSpeechSenses.first.senses.first,
      word: word,
    );
  }

  if (args.all || args.audioWordSilence) {
    await exportAudioWordSilence(word: word);
  }

  if (args.all || args.reelAudio) {
    await exportReelAudio(word: word, lang: lang);
  }

  if (args.all || args.reel) {
    await exportReel(
      lang: lang,
      word: word,
      x: wordRaw.verticalX,
    );
  }
}
