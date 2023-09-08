class Ffmpeg {
  static input(String path) {
    return [
      //
      '-i', path,
    ];
  }

  static silence(Duration duration) {
    return [
      //
      '-t', (duration.inMilliseconds / 1000).toString(),
      '-f', 'lavfi',
      '-i', 'anullsrc=r=24000:cl=mono',
    ];
  }

  static concatAudio({required int count}) {
    final streams = [for (int i = 0; i < count; i++) '[$i:a]'].join();

    return [
      '-filter_complex',
      '${streams}concat=n=$count:v=0:a=1[aout]',
    ];
  }

  static exportAudio(String path) {
    return [
      //
      '-map', '[aout]',
      '-b:a', '192k',
      '-y',
      path,
    ];
  }
}
