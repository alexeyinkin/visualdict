Future<T> errorToException<T>(Future<T> future) async {
  try {
    return await future;
  } on Error catch (error) {
    throw Exception(error);
  }
}
