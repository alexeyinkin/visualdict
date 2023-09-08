import 'dart:io';
import 'dart:math';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';

import '../constants.dart';

const _width = 1080;
const _height = 1920;
const _fps = 30;
const _outroDuration = Duration(milliseconds: 3000);
const _crossDissolveDuration = Duration(milliseconds: 500);

Future<void> exportReel({
  required String lang,
  required String word,
  required double x,
}) async {
  final exportWordDir = getExportWordDir(word, toRepositoryRoot: toRoot);
  final name = wordToFileName(word);

  final tempDirPath = '${exportWordDir.path}/temp';
  final tempDir = Directory(tempDirPath);

  if (!tempDir.existsSync()) {
    tempDir.createSync(recursive: true);
  }

  final imageFile = _getImageFile(word);

  final (mainWidth, mainHeight) = await ImageMagick.dimensions(imageFile.path);

  final xScale = _width / mainWidth;
  final yScale = _height / mainHeight;
  final scale = max(xScale, yScale);

  final maxXOffset = mainWidth - _width / scale;
  final xOffset = maxXOffset * (x + 1) / 2;

  print('Scale: $scale');
  print('Max X Offset: $maxXOffset');
  print('X Offset: $xOffset');

  // Crop to aspect ratio.
  {
    final x = xOffset.floor();
    final y = 0;
    final w = (_width / scale).floor();
    final h = (_height / scale).floor();

    await _run(
      'magick',
      [
        //
        imageFile.path,
        '-crop', '${w}x$h+$x+$y',
        '-quality', '100%',
        '$tempDirPath/main.png',
      ],
    );
  }

  final audioPath = '${exportWordDir.path}/$name-reel-$lang.mp3';
  final audioDuration = await Ffmpeg.getDuration(audioPath);
  print(audioDuration);

  final audioSeconds = audioDuration.inMilliseconds / 1000;
  final frames = (audioSeconds * _fps).floor();
  final step = .2 / (audioSeconds * _fps);
  final crossDissolveSeconds = _crossDissolveDuration.inMilliseconds / 1000;
  final outroStart = audioDuration - _crossDissolveDuration;
  final outroStartSeconds = outroStart.inMilliseconds / 1000;
  final outroFrames = (_outroDuration.inMilliseconds / 1000 * _fps).floor();

  final highres = 'scale=8000:-1';
  final zoompan = 'zoompan=z=\'zoom+$step\':x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):d=$frames:s=${_width}x$_height:fps=$_fps[zoomed]';
  final overlay = '[zoomed][1:v] overlay=0:H-h[overlaid]';
  final outro = '[2:v]loop=loop=$outroFrames:size=1:start=0[outro]';
  final join = '[overlaid][outro]xfade=transition=fade:duration=$crossDissolveSeconds:offset=$outroStartSeconds,format=yuv420p';

  await _run(
    'ffmpeg',
    [
      //
      ...FfmpegArgs.input('$tempDirPath/main.png'),
      ...FfmpegArgs.input('${exportWordDir.path}/$name-bottom-$lang.png'),
      '-framerate', '$_fps',
      ...FfmpegArgs.input('assets/video/reel-outro-$lang.png'),
      ...FfmpegArgs.input('${exportWordDir.path}/$name-reel-$lang.mp3'),

      '-filter_complex',
      '$highres, $zoompan; $overlay; $outro; $join',

      '-map', '3:a:0',
      '-codec:a', 'copy',
      '-codec:v', 'libx264',
      '-y',
      '${exportWordDir.path}/$name-reel-$lang.mp4',
    ],
  );
}

File _getImageFile(String word) {
  final srcDir = getRawWordDir(word, toRepositoryRoot: toRoot);

  final name = wordToFileName(word);
  final files = [
    File('${srcDir.path}/${name}-vertical.png'),
    File('${srcDir.path}/${name}.png'),
  ];

  for (final file in files) {
    if (file.existsSync()) {
      return file;
    }
  }

  throw Exception('None of the candidate files exists: $files');
}

Future<ProcessResult> _run(String executable, List<String> arguments) async {
  final result = await Process.run(executable, arguments);

  if (result.exitCode != 0) {
    print(result.stderr);
    throw Exception('Exit code ${result.exitCode}: $executable, $arguments');
  }

  return result;
}
