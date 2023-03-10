extension StreamFirstWhereTypeExtension<T> on Stream<T> {
  Future<T> firstWhereType<T>() async {
    final result = await firstWhere((element) => element is T);
    return result as T;
  }
}
