extension StreamFirstWhereTypeExtension<S> on Stream<S> {
  Future<T> firstWhereType<T>([bool Function(T)? test]) async {
    final result = await firstWhere(
        (element) => element is T && (test?.call(element) ?? true));
    return result as T;
  }
}
