import 'dart:io';
import 'dart:math';

const _silenceDb = -50;

Future<void> splitMp3BySilence({
  required File input,
  required Duration minDuration,
  required Directory dstDir,
}) async {
  final fragments = await _getFragments(
    input: input,
    minDuration: minDuration,
  );

  for (final fragment in fragments) {
    final result = await Process.run(
      'ffmpeg',
      [
        // Input.
        '-i', input.path,

        // Fragment.
        '-ss', '${max(fragment.start - .1, 0)}',
        if (fragment.end != null) ...['-to', '${fragment.end}'],

        // Output.
        '-c', 'copy',
        '-y', // Overwrite.
        '${dstDir.path}/${fragment.index}.mp3',
      ],
    );

    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
  }
}

Future<List<MediaFragment>> _getFragments({
  required File input,
  required Duration minDuration,
}) async {
  final silenceDetector = await Process.run(
    'ffmpeg',
    [
      //
      '-i', input.path,
      '-af',
      'silencedetect=n=${_silenceDb}dB:d=${minDuration.inMilliseconds / 1000}',
      '-f', 'null',
      '-',
    ],
  );

  if (silenceDetector.exitCode != 0) {
    print(silenceDetector.stderr);
    throw Exception(silenceDetector);
  }

  final output = silenceDetector.stderr as String;

  // Example output (there are also other non-matching lines):
  // [silencedetect @ 0x56091bed4d80] silence_start: 0.435292
  // [silencedetect @ 0x56091bed4d80] silence_end: 2.96767 | silence_duration: 2.53238
  // [silencedetect @ 0x56091bed4d80] silence_start: 3.36821
  // [silencedetect @ 0x56091bed4d80] silence_end: 5.92775 | silence_duration: 2.55954
  // [silencedetect @ 0x56091bed4d80] silence_start: 6.51987
  // [silencedetect @ 0x56091bed4d80] silence_end: 9.0005 | silence_duration: 2.48062
  final reSilenced = RegExp(r'silence_start: (\d+(\.\d+)?)$');
  final reResumed = RegExp(r'silence_end: (\d+(\.\d+)?) \|');

  final result = <MediaFragment>[];
  double start = 0;
  int nextIndex = 0;

  for (final line in output.split('\n')) {
    final resumedMatch = reResumed.firstMatch(line);
    if (resumedMatch != null) {
      start = double.parse(resumedMatch[1]!);
      continue;
    }

    final silencedMatch = reSilenced.firstMatch(line);
    if (silencedMatch != null) {
      final end = double.parse(silencedMatch[1]!);

      result.add(
        MediaFragment(
          start: start,
          end: end,
          index: nextIndex++,
        ),
      );
    }
  }

  result.add(
    MediaFragment(
      start: start,
      end: null,
      index: nextIndex,
    ),
  );

  return result;
}

class MediaFragment {
  final double start;
  final double? end;
  final int index;

  const MediaFragment({
    required this.start,
    required this.end,
    required this.index,
  });
}
