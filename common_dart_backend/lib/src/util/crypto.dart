import 'package:crypto/crypto.dart';

/// Returns a hash short enough to keep URLs not ugly
/// but long enough to prevent guesses.
///
/// Not crypto-secure, only to reduce mass-guessing.
/// Use only for non-critical files when each one is OK to be guessed.
String getFileHashForName(List<int> bytes) {
  const length = 10;
  return md5.convert(bytes).toString().substring(0, length);
}
