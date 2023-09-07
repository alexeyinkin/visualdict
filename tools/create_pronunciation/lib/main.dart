import 'dart:convert';
import 'dart:io';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:create_pronunciation/visitors/mp3_fragments.dart';
import 'package:create_pronunciation/visitors/murf_ai_request.dart';

import 'args.dart';
import 'tokens.dart';

const _toRoot = '../..';
const _detectSilenceDuration = Duration(milliseconds: 2000);
final _tempDir = Directory('temp');

Future<void> main(List<String> rawArgs) async {
  final args = WordCreatePronunciationArgs.parse(rawArgs);
  // As the Terms of Service of Murf.ai disallow automation,
  // this script creates a single piece of text
  // to be given to the service and exported manually.
  // It is then split to produce individual words' MP3s.

  final words = [
    ...{
      ...await stdin.transform(utf8.decoder).transform(LineSplitter()).toList()
    }
  ];

  final tokensByLang = _getTokens(words, args);

  if (args.generate) {
    final v = MurfAiRequestVisitor();
    await v.visitTokens(tokensByLang);
    print(requestToManualRequest(v.request));
    return;
  }

  if (args.split != null) {
    await splitMp3BySilence(
      input: File(args.split!),
      minDuration: _detectSilenceDuration,
      dstDir: _tempDir,
    );

    final v = Mp3FragmentsVisitor(directory: _tempDir);
    await v.visitTokens(tokensByLang);
    return;
  }

  throw Exception('Provide either --generate, or --split.');
}

Map<String, List<PronunciationToken>> _getTokens(
  List<String> words,
  WordCreatePronunciationArgs args,
) {
  return _mergeMaps(
    words.map((word) => _getWordTokens(word, args)),
  );
}

Map<String, List<PronunciationToken>> _getWordTokens(
  String word,
  WordCreatePronunciationArgs args,
) {
  final result = <String, List<PronunciationToken>>{};

  if (args.word) {
    _addTokenToMap(result, WordToken(word: word));
  }

  late final wordPublic = WordPublic.fromJson(
      {'id': word, ...getWordPublicMap(word, toRepositoryRoot: _toRoot)});

  Sense _requireFirstSense() {
    final posSenses = wordPublic.partOfSpeechSenses.firstOrNull;
    if (posSenses == null) {
      throw Exception('No partOfSpeechSenses in $word');
    }

    final sense = posSenses.senses.firstOrNull;
    if (sense == null) {
      throw Exception('No senses in $word -> ${posSenses.partOfSpeech.name}');
    }

    return sense;
  }

  if (args.usage) {
    final sense = _requireFirstSense();
    final usage = sense.usages.firstOrNull;
    if (usage == null) {
      throw Exception('No usages in $word -> ${sense.definition}');
    }

    _addTokenToMap(result, UsageToken(word: word, usage: usage.text));
  }

  for (final lang in args.defLangs) {
    final sense = _requireFirstSense();
    final translation = sense.definitionTranslations[lang];
    if (translation == null) {
      throw Exception(
        'No translation in $word -> ${sense.definition} -> $lang',
      );
    }

    _addTokenToMap(
      result,
      DefinitionToken(
        lang: lang,
        word: word,
        definition: translation.text,
      ),
    );
  }

  return result;
}

void _addTokenToMap(
  Map<String, List<PronunciationToken>> map,
  PronunciationToken token,
) {
  final lang = token.lang;

  if (!map.containsKey(lang)) {
    map[lang] = [token];
  } else {
    map[lang]!.add(token);
  }
}

Map<K, List<V>> _mergeMaps<K, V>(Iterable<Map<K, Iterable<V>>> maps) {
  final result = <K, List<V>>{};

  for (final map in maps) {
    for (final entry in map.entries) {
      final lang = entry.key;

      if (!result.containsKey(lang)) {
        result[lang] = [...entry.value];
      } else {
        result[lang]!.addAll(entry.value);
      }
    }
  }

  return result;
}
