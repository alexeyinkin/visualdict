extension ListExtension<T> on List<T> {
  List<List<T>> chunks(int n) {
    List<List<T>> result = [];

    for (int i = 0; i < length; i += n) {
      result.add(sublist(i, i + n > length ? length : i + n));
    }

    return result;
  }
}
